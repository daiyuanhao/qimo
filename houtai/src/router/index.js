import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Home from '@/components/Home'
import admin from '@/components/admin'
import category from '@/components/category'
import customer from '@/components/customer'
import order from '@/components/order'
import ticket from '@/components/ticket'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/home',
      redirect: '/home/admin',
      name: 'Home',
      component: Home,
      children: [
        {
          path: 'admin',
          name: 'admin',
          component: admin
        },
        {
          path: 'category',
          name: 'category',
          component: category
        },
        {
          path: 'customer',
          name: 'customer',
          component: customer
        },
        {
          path: 'order',
          name: 'order',
          component: order
        },
        {
          path: 'ticket',
          name: 'ticket',
          component: ticket
        }
      ]
    }
  ]
})
