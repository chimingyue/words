import Vue from 'vue'
import Router from 'vue-router'

import Home from './Home.vue'
import Select from './views/Select.vue'
import Study from './views/Study.vue'
import Context from './views/Context.vue'

import Python from "./components/myclass/Python.vue"
import Myclass from "./components/myclass/Myclass.vue"
import news from "./components/myclass/news.vue"
import find from "./components/myclass/find.vue"
import findID from "./components/myclass/findID.vue"
import back from "./components/myclass/back.vue"

import My from './components/me/My.vue'
import Login from './components/me/Login.vue'
import Book from './components/me/Book.vue'
import CiKu from './components/me/CiKu.vue'
import tuoZhan from './components/me/tuoZhan.vue'
import KeSi from './components/me/KeSi.vue'
import register from './components/me/register.vue'
import Edit from './components/me/Edit.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',component:Home},
    {path:'/Select',component:Select},
    {path:'/Study',component:Study},
    {path:'/Context',component:Context},
    {path:'/Myclass',component:Myclass},
    {path:'/news/:cid',component:news,name:'cid',props:true},
    {path:'/find/:nid',component:findID,name:'nid',props:true},
    {path:'/Python',component:Python},
    {path:'/find',component:find},
    {path:'/back',component:back},
    {path:'/Login',component:Login},
    {
      path:"/My",
      component:My
    },
    {
      path:"/Login",
      component:Login
    },
    {
      path:"/Book",
      component:Book
    },
    {
      path:"/CiKu",
      component:CiKu
    },
    {
      path:"/tuoZhan",
      component:tuoZhan
    },
    {
      path:"/KeSi/:eid",
      name:'eid',
      props:true,
      component:KeSi
    },
    {
      path:"/register",
      component:register
    },
    {
      path:"/Edit",
      component:Edit
    }

  ]
})
