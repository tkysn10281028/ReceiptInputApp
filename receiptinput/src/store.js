import Vuex from "vuex";
import vuexPersistedState from 'vuex-persistedstate'
import Vue from 'vue'
Vue.use(Vuex);

function getDefaultState() {
    return {
      userInfo:null,
      userList:null
    };
  }

const store = new Vuex.Store({
    plugins: [
        vuexPersistedState({
          key: "receiptInput",
          paths: ["userInfo","userList"],
          storage: window.sessionStorage,
        }),
      ],
    state: getDefaultState,
  getters: {
    getUserInfo(state) {
      return state.userInfo;
    },
    getUserList(state) {
        return state.userList;
    },
  },
  mutations: {
    setUserInfo(state, val) {
      state.userInfo = val;
    },
    setUserList(state, val) {
        state.userList = val;
    },
    clearState(state){
      Object.assign(state,getDefaultState())
    }
  },
});
export default store;