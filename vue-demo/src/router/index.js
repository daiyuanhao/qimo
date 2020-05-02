import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import order from '@/components/order'
import user from '@/components/user'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/order',
      name: 'order',
      component: order
    },
    {
      path: '/user',
      name: 'user',
      component: user
    }
  ]
})
