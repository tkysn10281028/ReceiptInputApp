<template>
  <div id="main-view">
    <MyHeaderView></MyHeaderView>
    <input type="text" /> <br />
  </div>
</template>

<script>
import MyHeaderView from "../organisms/HeaderView.vue";
export default {
  components: {
    MyHeaderView,
  },
};
</script>