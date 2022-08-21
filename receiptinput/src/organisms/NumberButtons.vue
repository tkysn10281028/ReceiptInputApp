<template>
  <div id="number-buttons">
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
          <MyInputButton
            :buttonValue="valueSubmit"
            @clickButton="inputNumber"
          ></MyInputButton>
          <MyInputButton
            :buttonValue="valueDetails"
            @clickButton="isOpen = !isOpen"
          ></MyInputButton>
        </div>
      </div>
    </div>
    <h2>{{ inputValue.join("") }}</h2>
    <div class="table-content" v-if="isOpen">
      <table>
        <tr>
          <th>大項目名</th>
          <th>金額</th>
        </tr>
        <tr v-for="item in computedDetailList" :key="item.id">
          <td>{{ item.name }}</td>
          <td>{{ item.price }}円</td>
        </tr>
      </table>
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
      valueSubmit: "投稿",
      valueDetails: "明細",
      isOpen: false,
    };
  },
  props: {
    detailList: Array,
  },
  computed: {
    computedDetailList: function () {
      return this.detailList.map((detail) => {
        return {
          id: detail.MajorItemId,
          name: detail.MajorItemName,
          price: detail.MajorItemPrice,
        };
      });
    },
  },
  components: {
    MyInputButton,
  },
  methods: {
    inputNumber: function (event) {
      if (event == "AC") {
        this.inputValue = [];
        return;
      }
      if (this.inputValue.length == 20) {
        return;
      }
      if (this.inputValue[0] == "0") {
        this.inputValue.splice(0);
      }
      if (event == "投稿") {
        this.$emit("inputValue", this.inputValue.join(""));
        this.inputValue = [];
        return;
      }
      this.inputValue.push(event);
    },
  },
};
</script>
<style scoped>
.group-column {
  display: flex;
  justify-content: center;
}
li {
  list-style: none;
}
.table-content {
  display: flex;
  justify-content: center;
}

table {
  width: 100%;
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
}

table th,
table td {
  padding: 10px 0;
  text-align: center;
}

table tr:nth-child(odd) {
  background-color: #eee;
}
</style>