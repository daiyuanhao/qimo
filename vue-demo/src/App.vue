<template>
  <div id="app">
    <router-view/>
    <tab></tab>
  </div>
</template>

<script>
import tab from '@/components/tab.vue'

export default {
  name: 'App',
  components:{
    tab
  }
}
</script>

<style>
@import url('./reset.css');
</style>
