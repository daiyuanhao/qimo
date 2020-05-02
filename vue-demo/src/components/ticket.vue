<template>
  <div class="ticket">
    <ul>
      <li class="ticket-item">
        <img src="..\assets\file-1568690437068.jpg" alt="">
        <h3>方特梦幻王国冰雪节夜场票</h3>
        <p class="sale">60人消费<span class="old-price">￥150</span></p>
        <p class="tag">特价门票<span class="discount-price">￥115</span></p>
        <div class="tip"><span class="tip-item">今日可定</span><span class="tip-item">今日可定</span><span class="tip-item">今日可定</span></div>
      </li>
      <li class="ticket-item">
        <img src="..\assets\file-1568690503172.jpg" alt="">
        <h3>方特梦幻王国冰雪节夜场票</h3>
        <p class="sale">60人消费<span class="old-price">￥150</span></p>
        <p class="tag">特价门票<span class="discount-price">￥115</span></p>
        <div class="tip"><span class="tip-item">今日可定</span><span class="tip-item">今日可定</span><span class="tip-item">今日可定</span></div>
      </li>
      <li class="ticket-item">
        <img src="..\assets\file-1568690511636.png" alt="">
        <h3>方特梦幻王国冰雪节夜场票</h3>
        <p class="sale">60人消费<span class="old-price">￥150</span></p>
        <p class="tag">特价门票<span class="discount-price">￥115</span></p>
        <div class="tip"><span class="tip-item">今日可定</span><span class="tip-item">今日可定</span><span class="tip-item">今日可定</span></div>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {}
</script>

<style scoped lang="stylus">
  .ticket{
    .ticket-item{
      border-top 1px solid #aaa
      padding 10px
      box-sizing border-box
      height 100px
      img{
        width 100px
        height 80px
        background red
        float left
        margin-right 10px
      }
      h3,.sale,.tag{
        margin-bottom 5px
      }
      .sale{
        color #888
        font-size 12px
        .old-price{
          text-decoration line-through
          float right
        }
      }
      .tag{
        color #444
        font-size 14px
        .discount-price{
          color orange 
          font-size 20px
          float right
          margin-top -4px
        }
      }
      .tip{
        float left 
        bottom 0
        .tip-item{
          display: inline-block
          padding 4px 2px
          font-size 14px
          color #6a6
          border 1px solid #6a6
          margin-right 10px
        }
      }
    }
  }
</style>