<template>
  <div id="main-view">
    <MyHeaderView></MyHeaderView>
    <h1>金額入力</h1>
    <MyInputSelect :selectList="selectList"></MyInputSelect>
    <MyNumberButton></MyNumberButton>
  </div>
</template>

<script>
import MyHeaderView from "../organisms/HeaderView.vue";
import MyInputSelect from "../atoms/inputSelect.vue";
import MyNumberButton from "../organisms/NumberButtons.vue";
export default {
  components: {
    MyHeaderView,
    MyInputSelect,
    MyNumberButton,
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
  created: function () {
    let userId = null;
    if (this.$store.getters.getUserInfo != null) {
      userId = this.$store.getters.getUserInfo.userId;
    } else {
      userId = "001";
    }
    const url = location.origin + "/api/v1/getUserInfoByUserId";
    const params = new URLSearchParams();
    params.append("userId", userId);
    params.append("date", "2022/8/12");
    this.axios
      .post(url, params, this.serverPass + "login")
      .then((response) => {
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    showDetails: function () {},
  },
};
</script>