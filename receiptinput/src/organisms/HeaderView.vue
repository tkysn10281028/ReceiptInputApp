<template>
  <div id="header-view">
    <div class="group-row-next-link">
      <h1 class="group-item-next-link">Go Back</h1>
      <h1 class="group-item-next-link">Header</h1>
      <h1 class="group-item-next-link">Go Next</h1>
    </div>
    <MyHeaderDateTime></MyHeaderDateTime>
  </div>
</template>

<script>
import MyHeaderDateTime from "../atoms/HeaderDateTime.vue";
export default { components: { MyHeaderDateTime } };
</script>
<style scoped>
.group-row-next-link {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.group-item-next-link {
  padding: 0px 50px 0px 50px;
}
</style>