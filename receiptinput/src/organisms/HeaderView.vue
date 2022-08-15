<template>
  <div id="header-view">
    <div class="group-row-next-link">
      <transition name="bounce">
        <div class="group-item-next-link" v-if="isOpen">
          <img src="../assets/left.png" alt="" />
          <h3 class="next-link-label">{{ linkLeftLabel }}</h3>
        </div>
      </transition>
      <MyHeaderDateTime
        class="header-date-time"
        @click.native="isOpen = !isOpen"
      ></MyHeaderDateTime>
      <transition name="bounce">
        <div class="group-item-next-link" v-if="isOpen">
          <img src="../assets/right.png" alt="" />
          <h3 class="next-link-label">{{ linkRightLabel }}</h3>
        </div>
      </transition>
    </div>
  </div>
</template>

<script>
import MyHeaderDateTime from "../atoms/HeaderDateTime.vue";
export default {
  components: { MyHeaderDateTime },
  data() {
    return {
      isOpen: true,
      linkLeft: "",
      linkRight: "",
      linkLeftLabel: "",
      linkRightLabel: "",
    };
  },
  created: function () {
    this.createLinkAndLabel();
  },
  methods: {
    createLinkAndLabel: function () {
      console.log(this.$route.path);
      switch (this.$route.path) {
        case "/":
          this.linkLeft = "/setting";
          this.linkLeftLabel = "全体設定画面";
          this.linkRight = "/edit";
          this.linkRightLabel = "編集画面";
          break;
        case "/edit":
          this.linkLeft = "/";
          this.linkLeftLabel = "金額入力";
          this.linkRight = "/outputcsv";
          this.linkRightLabel = "CSV出力";
          break;
        case "/outputcsv":
          this.linkLeft = "/edit";
          this.linkLeftLabel = "編集画面";
          this.linkRight = "/setting";
          this.linkRightLabel = "全体設定画面";
          break;
        case "/setting":
          this.linkLeft = "/outputcsv";
          this.linkLeftLabel = "CSV出力";
          this.linkRight = "/";
          this.linkRightLabel = "金額入力";
          break;
        default:
          break;
      }
    },
  },
};
</script>
<style scoped>
.group-row-next-link {
  display: flex;
  justify-content: center;
  align-items: center;
}
.next-link-label {
  margin: 0;
}
.bounce-enter-active {
  animation: bounce-in 1.5s;
}
.bounce-leave-active {
  animation: bounce-in 1.5s reverse;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1);
  }
  100% {
    transform: scale(1);
  }
}
</style>