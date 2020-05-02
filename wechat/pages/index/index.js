// pages/index/index.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    keyword: '',
    ads: [],
    categories: [],
    hottickets: [],
    page: 0,

    nomore:false,
    loading:false
  },
  loginSuccess(e) {
    console.log(e)
  },
  input(e) {
    this.setData({
      keyword: e.detail.value
    })
  },
  showData(){
   
    wx.setStorageSync('a',1);
    console.log(wx.getStorageSync('a'))
    wx.removeStorageSync('a')
  },
  search() {
    this.data.page = 1;
    this.data.nomore=false;
    console.log(this.data.keyword);
    wx.request({
      url: 'http://localhost:3000/client/ticket/get',
      data: {
        keyword: this.data.keyword,
        page: this.data.page
      },
      success: (result) => {
        this.setData({
          hottickets: result.data.rows
        })
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    console.log("onLoad");
    wx.request({
      url: 'http://localhost:3000/client/ads/get', //地址
      data: {}, //传递到服务器的参数
      method: "get", //请求方式，默认是get
      success: (result) => {
        console.log(result.data.rows)
        this.setData({
          ads: result.data.rows
        })
      }
    })
    wx.request({
      url: 'http://localhost:3000/client/category/get',
      success: (result) => {
        console.log(result.data.rows)
        var arr = [
          []
        ];
        result.data.rows.forEach((item) => {
          if (arr[arr.length - 1].length >= 5) {
            arr.push([])
          }
          arr[arr.length - 1].push(item)
        })
        console.log(arr)
        this.setData({
          categories: arr
        })
      }
    })
    this.search()
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {
    console.log("onReady")
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {
    console.log("onShow")
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },
  gotolist(event){
   var catid=event.currentTarget.dataset.item.Id;
   wx.navigateTo({
     url:"/pages/list/list?id="+catid
   })
  },
  gototicket(event) {
    var ticket = JSON.stringify(event.currentTarget.dataset.item);
    wx.navigateTo({
      url: "/pages/ticket/ticket?ticket=" + ticket
    })
  },
  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {
    console.log('刷新');
    this.search();
    wx.stopPullDownRefresh();
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {
    if (this.data.nomore == false) {
      this.data.page++;
      this.setData({
        loading:true
      })
      console.log(this.data.keyword);
      wx.request({
        url: 'http://localhost:3000/client/ticket/get',
        data: {
          keyword: this.data.keyword,
          page: this.data.page
        },
        success: (result) => {
          if (result.data.rows.length != 0) {
            result.data.rows.forEach(row => {
              this.data.hottickets.push(row);
            })
          
            this.setData({
              hottickets: this.data.hottickets,
              loading:false
            })
          } else {
            this.setData({
              nomore: true,
              loading:false
            })
          }

        }
      })
    }
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  },

  load(e) {
    console.log("图片加载成功")
    console.log(e)
  },
  error(e) {
    console.log("加载失败")
    console.log(e)
  }
})