<template>
  <div>
    <mt-header title="" id="d1">
        <router-link to="/home" slot="left">
        <mt-button icon="back" @click="tofind">返回</mt-button>
        </router-link>
  </mt-header>
  <div class="yihan">
      <img src="http://127.0.0.1:3000/xz/sorry.png" alt=""> 
    <p>敬请期待哟~</p>
  </div>
  </div>
</template>
<script>
export default {
  data(){
    return{

    }
  },
  methods: {
    tofind(){
           sessionStorage.setItem("active","find");
           sessionStorage.setItem("isSelected","true");
        }
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
.mint-button-text{
    font-size:1rem;
}
.yihan{
  margin-top:50%;
  text-align:center;
}
.yihan img{
  width:100px;height:100px;
}
.yihan p{
  color:#8a8a8a;
}
</style>
