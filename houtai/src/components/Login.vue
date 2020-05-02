<template>
  <div class="login">
    <el-form label-width="80px">
      <el-form-item label="用户名 :">
        <el-input
          v-model="username"
          placeholder="请输入用户名"
          clearable
        ></el-input>
      </el-form-item>
      <el-form-item label="密码 :">
        <el-input
          v-model="password"
          placeholder="请输入密码"
          show-password
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="login">登录</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: "",
      password: ""
    };
  },
  methods: {
    login() {
      this.axios
        .post("/api/login", {
          loginname: this.username,
          password: this.password
        })
        .then(res => {
          let success = res.data.success;
          if (success) {
            this.$router.push({
              path: "/home"
            });
          }
        });
    }
  }
};
</script>

<style scoped lang="stylus">
.login{
  width 400px
  margin 200px auto
  padding 10px
  border 1px solid #aaa
}
</style>
