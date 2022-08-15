<template>
  <div id="input-button">
    <button @touchstart="onClick" class="btn btn--yellow btn--cubic">
      {{ value }}
    </button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      value: this.buttonValue,
    };
  },
  props: {
    buttonValueNumber: String,
    buttonValue: String,
  },
  methods: {
    onClick: function () {
      this.$emit("clickButton", this.value);
    },
  },
};
</script>
<style scoped>
button {
  font-family: Georgia, "Times New Roman", Times, serif;
  font-size: 20px;
  width: 80px;
  height: 80px;
  margin: 2px;
}
button.btn--yellow {
  color: #000;
  background-color: rgb(0, 255, 68);
  border-bottom: 5px solid rgb(0, 213, 57);
}

button.btn--yellow:active {
  color: #000;
  background: #fff20a;
  -webkit-transform: translate(0, 2px);
  -moz-transform: translate(0, 2px);
  transform: translate(0, 2px);
  border-bottom: none;
}
</style>