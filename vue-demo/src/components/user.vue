<template>
  <div class="user">
    <div class="title">头像</div>
    <div class="avatar">
      <img src="../assets/head.jpg" alt="">
      点击修改头像
    </div>
    <div class="title">个人资料</div>
    <div class="info">
      <ul>
        <li><span class="label">UID</span><input type="text" disabled value="7661"></li>
        <li><span class="label">昵称</span><input type="text" value="dyh"></li>
        <li><span class="label">性别</span><input type="text" disabled value="男"></li>
        <li><span class="label">所在地</span><input type="text" value="福建 莆田"></li>
      </ul>
    </div>
    <el-button></el-button>
  </div>
</template>

<script>
  export default {
    
  }
</script>

<style scoped lang="stylus">
  .title{
    height 40px
    line-height 40px
    background #eee
    padding 0 10px
    color #555
    clear both
  }
  .avatar{
    height 100px
    line-height 100px
    color #555
    border-top 1px solid #aaa
    border-bottom 1px solid #aaa
    img{
      float left
      width 80px
      height 80px
      border 1px solid #000f
      border-radius 50%
      margin 10px 30px 10px 10px
    }
  }
  .info{
    border-top 1px solid #aaa
    border-bottom 1px solid #aaa
    li{
      height 60px
      line-height 60px
      margin-left 15px
      border-bottom 1px solid #aaa
      span{
        display inline-block
        width 120px
      }
      input{
        background none
        outline none
      }
      &:last-child{
        border-bottom none
      }
    }
  }
</style>