<template>
  <div id="header-date-time">
    <div class="clock">
      <h2>{{ clock }}</h2>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      clock: new Date().toLocaleString(),
    };
  },
  created: function () {
    let that = this;
    this.timer = setInterval(function () {
      that.clock = new Date().toLocaleString();
    }, 1000);
  },
};
</script>
<style scoped>
.clock {
  text-align: center;
}
</style>