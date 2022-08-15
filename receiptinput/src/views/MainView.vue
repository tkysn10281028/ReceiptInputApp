<template>
  <div id="main-view">
    <MyHeaderView></MyHeaderView>
    <h1>金額入力</h1>
    <MyInputSelect :selectList="selectList"></MyInputSelect>
    <MyNumberButtona></MyNumberButtona>
  </div>
</template>

<script>
import MyHeaderView from "../organisms/HeaderView.vue";
import MyInputSelect from "../atoms/inputSelect.vue";
import MyNumberButtona from "../organisms/NumberButtons.vue";
export default {
  components: {
    MyHeaderView,
    MyInputSelect,
    MyNumberButtona,
  },
  data() {
    return {
      selectList: [
        { value: "tomato", label: "トマト" },
        { value: "orange", label: "オレンジ" },
        { value: "apple", label: "りんご" },
      ],
    };
  },
};
</script>