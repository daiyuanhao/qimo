<template>
  <div class="category">
    <el-table :data="categoryData">
      <el-table-column prop="Id" label="Id" width="120"></el-table-column>
      <el-table-column prop="Name" label="Name"></el-table-column>
      <el-table-column label="图片">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.Src"
            style="width:80px;height:80px"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="SortNum" label="排序号"></el-table-column>
      <el-table-column prop="Enable" label="Enable"></el-table-column>
      <el-table-column label="操作" width="200" fixed="right">
        <template slot-scope="scope">
          <el-button type="info" size="small" @click="editCategory(scope.row)"
            >编辑</el-button
          >
          <el-button
            type="danger"
            size="small"
            @click="delCategory(scope.row.Id)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-footer>
      <el-button type="primary" size="small" @click="addCategory"
        >添加</el-button
      >
    </el-footer>
    <el-dialog
      :title="editState ? '编辑分类' : '添加分类'"
      :visible.sync="categoryDialog"
      width="30%"
      top="20vh"
    >
      <el-form label-width="80px">
        <el-form-item label="Id" v-if="editState">
          <el-input v-model="id" disabled></el-input>
        </el-form-item>
        <el-form-item label="分类名">
          <el-input v-model="name" clearable></el-input>
        </el-form-item>
        <el-form-item label="排序号">
          <el-input v-model="sortnum" clearable></el-input>
        </el-form-item>
        <el-form-item label="启用">
          <el-checkbox v-model="enable"></el-checkbox>
        </el-form-item>
        <el-form-item label="图片">
          <el-upload
            action=""
            :auto-upload="false"
            :limit="1"
            ref="upload"
            :http-request="operateCategory"
            multiple
          >
            <el-button type="primary" size="small">选择文件</el-button>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="operateCategory()">确 定</el-button>
        <el-button @click="categoryDialog = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      categoryData: null,
      categoryDialog: false,
      editState: false,
      id: 0,
      name: "",
      sortnum: 100,
      enable: true
    };
  },
  methods: {
    getcategory() {
      this.axios.get("/api/category/get").then(res => {
        this.categoryData = res.data.rows;
      });
    },
    addCategory() {
      this.categoryDialog = true;
      this.editState = false;
      this.name = "";
      this.sortnum = 100;
      this.enable = true;
    },
    delCategory(id) {
      this.axios.post("/api/category/delete", { id: id }).then(res => {
        if (res.data.success) this.getcategory();
      });
    },
    editCategory(row) {
      this.categoryDialog = true;
      this.editState = true;
      this.id = row.Id;
      this.name = row.Name;
      this.sortnum = row.SortNum;
      this.enable = row.Enable === 1;
    },
    operateCategory() {
      const formData = new FormData();
      const file = this.$refs.upload.uploadFiles[0];
      const headerConfig = {
        headers: { "Content-Type": "multipart/form-data" }
      };
      if (file) {
        formData.append("name", this.name);
        formData.append("sortnum", this.sortnum);
        formData.append("enable", this.enable ? 1 : 0);
        formData.append("file", file.raw);
        if (this.editState) {
          formData.append("id", this.id);
          this.axios
            .post("/api/category/edit", formData, headerConfig)
            .then(res => {
              console.log(res);
              if (res.data.success) this.getcategory();
            });
        } else {
          this.axios
            .post("/api/category/add", formData, headerConfig)
            .then(res => {
              if (res.data.success) this.getcategory();
            });
        }
      } else {
        if (this.editState) {
          this.axios
            .post("/api/category/edit", {
              id: this.id,
              name: this.name,
              sortnum: this.sortnum,
              enable: this.enable ? 1 : 0
            })
            .then(res => {
              console.log(res);
              if (res.data.success) this.getcategory();
            });
        }
      }
      this.categoryDialog = false;
      this.$refs.upload.clearFiles();
    }
  },
  created() {
    this.getcategory();
  }
};
</script>

<style scoped lang="stylus">
.el-footer{
  text-align right
  line-height 60px
}
</style>
