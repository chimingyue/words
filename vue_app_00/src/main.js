import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
import 'mint-ui/lib/style_et.css'
Vue.use(MintUI);
import 'swiper/dist/css/swiper.css'

import axios from 'axios'
//发送请求保存session信息
axios.defaults.withCredentials=true;
//设置请求基础路径
axios.defaults.baseURL="http://127.0.0.1:3000/"
//将axios注册到vue实例中
Vue.prototype.axios=axios

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
