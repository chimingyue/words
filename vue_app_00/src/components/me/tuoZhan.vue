<template>
<div class="tz_container">
    <mt-header title="拓展包" id="d1">
        <router-link to="/Home" slot="left">
        <mt-button icon="back" @click="tomy">返回</mt-button>
        </router-link>
  </mt-header>
  <div class="my_tuozhan" v-for="(item,i) of list" :key="i">
      <router-link :to="'/KeSi/'+item.eid" class="myrouter">
    <img :src="`http://127.0.0.1:3000/img/`+item.e_pic" alt="">
    <div class="my_tuozhan2">
    <span class="my_tzspan">{{item.e_title}}</span>
    <span class="my_tzspan2">{{item.e_content}}</span>
    </div>
    </router-link>
  </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      e_title:"",
      e_content:"",
      list:[]
    }
  },
  methods: {
   myciku(){
      this.axios.get("expansion").then(result=>{
      this.list=result.data;
     
      })
    },
    tomy(){
           sessionStorage.setItem("active","my");
           sessionStorage.setItem("isSelected","true");
        }
  },
  created() {
     this.myciku();
  },
}
</script>
<style scoped>
    #d1{
    margin-top:0.75rem;
    margin-bottom:0.75rem;
    background:#fff;
    color:#0c8e75;
    font-size:1rem;
}
.mint-header .mint-button {
    line-height: 41px;
    font-size: 0.5rem;
    color: #000;
}
.my_tuozhan{
  display: flex;
  justify-content: space-between;
  align-items: center;
 
}
.my_tzspan{
  display: flex;
  float: left;
  font-weight: bold;
  margin:25px 5px 3px 6px;
}
.my_tzspan2{
   float: left;
  margin-right: 24px;
  color:#8a8a8a;
  margin-left: 5px;
  flex-wrap: wrap-reverse;
}
.my_tuozhan img{
  width:50px;height:50px;
  margin:20px 0 20px 20px;
  
}
.myrouter{
  display: flex;
  color:black;
}

</style>
