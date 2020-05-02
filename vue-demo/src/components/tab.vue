<template>
  <div class="tab-wrapper">
    <router-link class="tab" to="/"><i class="el-icon-s-home"></i><br>首页</router-link>
    <router-link class="tab" to="/order"><i class="el-icon-s-order"></i><br>订单</router-link>
    <router-link class="tab" to="/user"><i class="el-icon-user-solid"></i><br>我的</router-link>
  </div>
</template>

<script>
  export default {}
</script>

<style scoped lang="stylus">
  .tab-wrapper{
    display: flex;
    width: 100%;
    height: 60px;
    position: fixed;
    background: #ddd;
    bottom: 0;
    .tab{
      flex:1;
      text-align: center;
      padding: 5px;
      font-size: 14px;
      color: #555;
      i{
        display: inline-block;
        font-size: 28px;
        margin-bottom: 2px;
      }
      &:hover{
        color: #090
      }
    }
  }
  
  
</style>