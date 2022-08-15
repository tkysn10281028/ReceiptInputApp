<template>
  <div id="number-buttons">
    <div>
      <h2></h2>
    </div>
    <div class="group-number-buttons">
      <div class="group-row">
        <div class="group-column">
          <MyInputButton
            :buttonValue="String(1)"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="String(2)"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="String(3)"
            @clickButton="inputNumber"
          ></MyInputButton>
        </div>
        <div class="group-column">
          <MyInputButton
            :buttonValue="String(4)"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="String(5)"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="String(6)"
            @clickButton="inputNumber"
          ></MyInputButton>
        </div>
        <div class="group-column">
          <MyInputButton
            :buttonValue="String(7)"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="String(8)"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="String(9)"
            @clickButton="inputNumber"
          ></MyInputButton>
        </div>
        <div class="group-column">
          <MyInputButton
            :buttonValue="String(0)"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="valueAC"
            @clickButton="inputNumber"
          ></MyInputButton>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import MyInputButton from "../atoms/inputButton.vue";
export default {
  data() {
    return {
      inputValue: [],
      valueAC: "AC",
    };
  },
  components: {
    MyInputButton,
  },
  methods: {
    inputNumber: function (event) {
      console.log(event);
    },
  },
};
</script>
<style scoped>
.group-column {
  display: flex;
  justify-content: center;
}
</style>