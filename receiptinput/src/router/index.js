import Vue from 'vue'
import VueRouter from 'vue-router'
import MainView from "../views/MainView.vue";
import EditItems from "../views/EditItems.vue"
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'main',
    component: MainView
  },
  {
    path: '/edit',
    name: 'edit',
    component: EditItems
  },
]

const router = new VueRouter({
  routes
})

export default router
