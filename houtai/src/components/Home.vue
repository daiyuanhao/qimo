<template>
  <div class="home">
    <el-container style="height: 100vh;">
      <el-aside width="260px" style="background-color: #545c64">
        <el-header>后台管理</el-header>
        <el-menu
          class="menu"
          default-active="/home/admin"
          background-color="#545c64"
          text-color="#fff"
          active-text-color="#ffd04b"
          router
        >
          <el-menu-item index="/home/admin">
            <span slot="title">管理员账号</span>
          </el-menu-item>
          <el-menu-item index="/home/category">
            <span slot="title">科目管理</span>
          </el-menu-item>
          <el-menu-item index="/home/customer">
            <span slot="title">题目管理</span>
          </el-menu-item>
          <el-menu-item index="/home/order">
            <span slot="title">题解管理</span>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view>
          <Link-active to="/admin"></Link-active>
        </router-view>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import Admin from "@/components/admin.vue";

export default {
  components: {
    Admin
  }
};
</script>

<style scoped lang="stylus">
.el-header {
  background-color: #373d42;
  color: #fff;
  line-height: 60px;
}
</style>
