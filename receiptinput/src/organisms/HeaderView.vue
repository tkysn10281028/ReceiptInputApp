<template>
  <div id="header-view">
    <div class="group-row-next-link">
      <transition name="bounce">
        <div class="group-item-next-link" v-if="isOpen">
          <img src="../assets/left.png" alt="" />
          <h3>Back</h3>
        </div>
      </transition>
      <MyHeaderDateTime
        class="header-date-time"
        @click.native="isOpen = !isOpen"
      ></MyHeaderDateTime>
      <transition name="bounce">
        <div class="group-item-next-link" v-if="isOpen">
          <img src="../assets/right.png" alt="" />
          <h3>Back</h3>
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
    };
  },
};
</script>
<style scoped>
.group-row-next-link {
  display: flex;
  justify-content: center;
  align-items: center;
}
.group-item-next-link {
  padding: 0px 50px 0px 50px;
}
.header-date-time {
  padding: 0px 100px 0px 100px;
}
.bounce-enter-active {
  animation: bounce-in 1s;
}
.bounce-leave-active {
  animation: bounce-in 0.5s reverse;
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