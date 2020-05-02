<template>
  <div class="admin">
    <el-table :data="adminData">
      <el-table-column
        prop="Id"
        label="Id"
        width="120"
        sortable
      ></el-table-column>
      <el-table-column prop="LoginName" label="LoginName"></el-table-column>
      <el-table-column label="操作" width="200" fixed="right">
        <template slot-scope="scope">
          <el-button
            type="warning"
            size="small"
            @click="resetAdmin(scope.row.Id)"
            >重置</el-button
          >
          <el-button type="danger" size="small" @click="delAdmin(scope.row.Id)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-footer>
      <el-button type="primary" size="small" @click="addAdminVisible = true"
        >添加</el-button
      >
    </el-footer>
    <el-dialog
      title="添加管理账号"
      :visible.sync="addAdminVisible"
      width="30%"
      top="20vh"
    >
      <el-form label-width="80px">
        <el-form-item label="登录名">
          <el-input
            v-model="username"
            placeholder="登录名最少5个字符"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button
          type="primary"
          @click="
            addAdmin();
            addAdminVisible = false;
          "
          >确 定</el-button
        >
        <el-button @click="addAdminVisible = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      adminData: null,
      addAdminVisible: false,
      username: ""
    };
  },
  methods: {
    getAdmin() {
      this.axios.get("/api/admin/get").then(res => {
        this.adminData = res.data.rows;
      });
    },
    addAdmin() {
      this.axios
        .post("/api/admin/add", { loginname: this.username })
        .then(res => {
          if (res.data.success) {
            this.getAdmin();
          }
        });
    },
    delAdmin(id) {
      this.axios.post("/api/admin/delete", { id: id }).then(res => {
        if (res.data.success) {
          this.getAdmin();
        }
      });
    },
    resetAdmin(id) {
      this.axios.post("/api/admin/reset", { id: id }).then(res => {
        if (res.data.success) {
          this.getAdmin();
        }
      });
    }
  },
  created() {
    this.getAdmin();
  }
};
</script>

<style scoped lang="stylus">
.el-footer{
  text-align right
  line-height 60px
}
</style>
