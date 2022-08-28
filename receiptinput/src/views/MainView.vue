<template>
  <div id="main-view">
    <MyHeaderView></MyHeaderView>
    <h1>金額入力</h1>
    <MyInputSelect
      :selectList="selectList"
      @changeCase="selectedMajorItemName = $event"
    ></MyInputSelect>
    <MyNumberButton
      :detailList="this.$store.getters.getUserInfo.ItemInfo"
      @inputValue="postValue"
    ></MyNumberButton>
  </div>
</template>

<script>
import MyHeaderView from "../organisms/HeaderView.vue";
import MyInputSelect from "../atoms/inputSelect.vue";
import MyNumberButton from "../organisms/NumberButtons.vue";
import utilFunc from "../utils/utilFunc.js";
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
      selectedMajorItemName: "",
    };
  },
  created: function () {
    let userId = "001";
    const url = location.origin + "/api/v1/getUserInfoByUserId";
    const params = new URLSearchParams();
    params.append("userId", userId);
    params.append("date", "2022/8/12");
    this.axios
      .post(url, params, this.serverPass + "login")
      .then((response) => {
        let data = response.data;
        this.makeItemTree(data);
        console.log(this.$store.getters.getUserInfo);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    showDetails: function () {},
    postValue: function (event) {
      console.log(event);
      console.log(this.selectedMajorItemName);
      if (this.selectedMajorItemName.value) {
        const url = location.origin + "/api/v1/postMajorItem";
        const params = new URLSearchParams();
        params.append("userId", this.$store.getters.getUserInfo.UserId);
        params.append("postedDate", utilFunc.generateDate());
        params.append("postedTime", utilFunc.generateTime());
        params.append("majorItemName", this.selectedMajorItemName.value);
        params.append("majorItemPrice", event);
        this.axios
          .post(url, params, this.serverPass + "login")
          .then((response) => {
            console.log(response);
          })
          .catch((error) => console.log(error));
      }
    },
    makeItemTree: function (data) {
      console.log(data);
      let itemInfo = Array.from(
        new Set(
          data.map((item) => {
            return item.MajorItemId.Int64;
          })
        )
      ).map((majorId) => {
        let middleItemList = data
          .filter((x) => x.MajorItemIdInMiddle.Int64 == majorId)
          .map((x) => x.MiddleItemId.Int64);
        return {
          MajorItemName: data.filter(
            (info) => info.MajorItemId.Int64 == majorId
          )[0].MajorItemName.String,
          MajorItemPrice: data.filter(
            (info) => info.MajorItemId.Int64 == majorId
          )[0].MajorItemPrice.Int64,
          MajorItemId: data.filter(
            (info) => info.MajorItemId.Int64 == majorId
          )[0].MajorItemId.Int64,
          MiddleItems: Array.from(new Set(middleItemList)).map((middleId) => {
            let minorItemList = data
              .filter((x) => x.MiddleItemIdInMinor.Int64 == middleId)
              .map((x) => x.MinorItemId.Int64);
            console.log(
              data.filter((info) => info.MiddleItemId.Int64 == middleId)
            );
            return {
              MiddleItemName: data.filter(
                (info) => info.MiddleItemId.Int64 == middleId
              )[0].MiddleItemName.String,
              MiddleItemPrice: data.filter(
                (info) => info.MiddleItemId.Int64 == middleId
              )[0].MiddleItemPrice.Int64,
              MiddleItemId: data.filter(
                (info) => info.MiddleItemId.Int64 == middleId
              )[0].MiddleItemId.Int64,
              MinorItems: minorItemList.map((minorId) => {
                return {
                  MinorItemName: data.filter(
                    (info) => info.MinorItemId.Int64 == minorId
                  )[0].MinorItemName.String,
                  MinorItemPrice: data.filter(
                    (info) => info.MinorItemId.Int64 == minorId
                  )[0].MinorItemPrice.Int64,
                  MinorItemPrice: data.filter(
                    (info) => info.MinorItemId.Int64 == minorId
                  )[0].MinorItemId.Int64,
                };
              }),
            };
          }),
        };
      });
      console.log(itemInfo);
      this.$store.commit("setUserInfo", {
        UserId: data[0].UserId.String,
        UserName: data[0].UserName.String,
        ItemInfo: itemInfo,
      });
      console.log(this.$store.getters.getUserInfo);
      this.selectList = Array.from(
        new Set(
          this.$store.getters.getUserInfo.ItemInfo.map(
            (info) => info.MajorItemName
          )
        )
      ).map((info) => {
        return {
          value: info,
          label: info,
        };
      });
    },
  },
};
</script>