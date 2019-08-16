<template>
  <div class="all">
    <mt-header title="我的单词书" id="d1">
        <router-link to="/Home" slot="left">
        <mt-button icon="back" @click="tomy">返回</mt-button>
        </router-link>
  </mt-header>
  <div class="yihan">
    <img src="../../assets/save_sorry.png" alt="">
    <p>您还没有收藏单词书哟</p>
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
    tomy(){
           sessionStorage.setItem("active","my");
           sessionStorage.setItem("isSelected","true");
        }
  },
}
</script>
<style scoped>
.all{
  text-align:center;
}
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
  text-align:center !important;
}
.yihan img{
  width:100px;height:100px;
}
.yihan p{
  color:#8a8a8a;
  
}
</style>
