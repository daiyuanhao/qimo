<template>
  <div class="customer">
    <el-table :data="customerData">
      <el-table-column prop="Id" label="Id" width="120"></el-table-column>
      <el-table-column prop="AppOpenId" label="AppOpenId"></el-table-column>
      <el-table-column prop="NickName" label="昵称"></el-table-column>
      <el-table-column label="头像">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.AvatarUrl"
            style="width:80px;height:80px"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column label="性别">
        <template slot-scope="scope">
          {{ scope.row.Sex == 1 ? "男" : "女" }}
        </template>
      </el-table-column>
      <el-table-column prop="Country" label="Country"></el-table-column>
      <el-table-column prop="Province" label="Province"></el-table-column>
      <el-table-column prop="City" label="City"></el-table-column>
      <el-table-column
        prop="WeChatBindPhone"
        label="WeChatBindPhone"
      ></el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      customerData: null
    };
  },
  mounted() {
    this.axios.get("/api/customer/get").then(res => {
      this.customerData = res.data.rows;
    });
  }
};
</script>

<style scoped lang="stylus"></style>
