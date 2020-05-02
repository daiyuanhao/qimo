<template>
  <div class="order">
    <el-table :data="orderData">
      <el-table-column prop="Id" label="Id" width="120"></el-table-column>
      <el-table-column prop="CustomerId" label="CustomerId"></el-table-column>
      <el-table-column prop="TicketId" label="TicketId"></el-table-column>
      <el-table-column prop="Price" label="Price"></el-table-column>
      <el-table-column prop="Quantity" label="Quantity"></el-table-column>
      <el-table-column prop="Total" label="Total"></el-table-column>
      <el-table-column prop="Mobile" label="Mobile"></el-table-column>
      <el-table-column prop="ContactName" label="ContactName"></el-table-column>
      <el-table-column prop="UseDate" label="UseDate"></el-table-column>
      <el-table-column prop="Status" label="Status"></el-table-column>
      <el-table-column prop="CreateTime" label="CreateTime"></el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      orderData: null
    };
  },
  mounted() {
    this.axios
      .get("/api/order/get", {
        customerId: 1
      })
      .then(res => {
        this.orderData = res.data.rows;
      });
  }
};
</script>

<style scoped lang="stylus"></style>
