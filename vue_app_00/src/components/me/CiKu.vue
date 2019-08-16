<template>
 <div class="ciku_container">
   <div class="myciku">
    <mt-header title="我的词库" id="d1">
        <router-link to="/Home" slot="left">
        <mt-button icon="back" @click="tomy">我的</mt-button>
        </router-link>
  </mt-header>
   </div>
    <div class="my_ciku" v-for="(item,i) of list" :key="i">
      <span class="ciku_span">{{item.word}}</span>
      <span class="ciku_span2">{{item.phonetic}}</span>
      <div class="means">
      <span>{{item.means_n}}</span>
      <span>{{item.means_v}}</span>
      <span>{{item.means_adj}}</span>
      <span>{{item.means_adv}}</span>
      <span>{{item.means_prep}}</span>
      </div>
    </div>
   </div>  
</template>
<script>
export default {
  data(){
    return{
      word:"",
      phonetic:"",
      mans_n:"",
      means_v:"",
      means_adj:"",
      means_adv:"",
      means_prep:"",
      list:[]

    }
  },
  methods: {
    tomy(){
           sessionStorage.setItem("active","my");
           sessionStorage.setItem("isSelected","true");
        }
  },
  created() {
    this.axios.get("word").then(result=>{
      this.list=result.data;
    })
  },
}
</script>
<style scoped>
  #d1{
    /* margin-top:0.75rem;
    margin-bottom:0.75rem; */
    background:#fff;
    color:#0c8e75;
    font-size:1rem;
    height:49px;
}
.mint-header .mint-button {
    line-height: 41px;
    font-size: 0.5rem;
    color: #000;
}
.mint-button-text{
    font-size:1rem;
}
.my_ciku{
  text-align: left;
}
.means{
  display: flex;
 flex-direction: column;
 
}
.ciku_container{
  padding-top:10px;
}
.ciku_span{
  font-weight: bold;
  font-size: 30px;
  margin:0 24px;
  color: #0c8e75;
}
.ciku_span2{
  font-size: 13px;
  height: 5px;
}
.means span{
  margin: 1px 0;
  width:300px;
  display: flex;
  align-items: center;
  margin-left:28px;
  color: #8a8a8a;
}
</style>
