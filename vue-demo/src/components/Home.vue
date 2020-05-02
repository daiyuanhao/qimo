<template>
  <div class="home">
    <div class="ads"><img src="../assets/file-1568621329915.jpg" alt=""></div>
    <div class="nav">
      <ul>
        <li class="nav-box"><img src="../assets/head.jpg" alt=""><br>学生认证</li>
        <li class="nav-box"><img src="../assets/head.jpg" alt=""><br>兼职招聘</li>
        <li class="nav-box"><img src="../assets/head.jpg" alt=""><br>福利精选</li>
        <li class="nav-box"><img src="../assets/head.jpg" alt=""><br>美食代购</li>
        <li class="nav-box"><img src="../assets/head.jpg" alt=""><br>出游聚会</li>
      </ul>
    </div>
    <div class="line"></div>
    <div class="sect">
      <ul>
        <li class="sect-box"><img src="../assets/head.jpg" alt="">
          <p>快递</p>
          <p>快递代拿 快递代寄</p>
        </li>
        <li class="sect-box"><img src="../assets/head.jpg" alt=""></li>
        <li class="sect-box"><img src="../assets/head.jpg" alt=""></li>
        <li class="sect-box"><img src="../assets/head.jpg" alt=""></li>
      </ul>
    </div>
    <div class="line"></div>
    <div class="hot">
      <div class="title">热门</div>
      <div class="search"><input type="text" placeholder="搜索"></div>
      <ticket></ticket>
    </div>
  </div>
</template>

<script>
  import ticket from '@/components/ticket.vue'

  export default {
    components:{
      ticket
    }
  }
</script>

<style scoped lang="stylus">
.home{
  padding-bottom 60px
  .ads{
    width: 100%
    height: 180px
    img{
      width 100%
      height 100%
    }
  }
  .nav{
    width:100%;
    position relative
    ul{
      display: flex
      padding: 10px 0
      .nav-box{
        flex: 1
        text-align: center
        font-size: 16px;
        color: #555
        img{
          display: inline-block
          width: 45px
          height: 45px
          border-radius 50%
          margin-bottom: 5px
        }
      }
    }
  }
  .sect{
    width:100%
    ul{
      padding: 5px
      .sect-box{
        width: calc(50% - 10px)
        float: left
        height: 80px
        background: #eee
        padding: 10px
        box-sizing:border-box
        text-align center
        margin:5px
        img{
          width:60px
          height:60px
          background:red
          float:left
        }
        p{
          margin-top 12px
        }
        p:nth-child(2){
          font-size 16px
        }
        p:nth-child(3){
          font-size 10px
        }
      }
    }
    &::after{
      content:''
      display block
      clear: left
    }
  }
  .line{
    width:100%
    height:10px
    background: #ddd
  }
  .hot{
    .title{
      height:30px
      line-height: 30px
      color #666
      &::before{
        display inline-block
        content: ''
        width 0
        height 30px
        border-left 4px solid #6c6
        margin-right 10px
        vertical-align top
      }
    }
    .search{
      padding 0 10px
      input{
        width 100%
        height 24px
        line-height 24px
        border-radius 15px
        background #ddd
        padding 0 15px
        margin 5px 0
        box-sizing border-box
        font-size 14px
        outline none
        color #333
      }
    }
  }
}
</style>