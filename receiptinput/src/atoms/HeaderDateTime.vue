<template>
  <div id="header-date-time">
    <h2>{{ clock }}</h2>
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