<template>
<div>
  <div>
      <mt-header title="拓展包" id="d1">
        <router-link to="/tuoZhan" slot="left">
        <mt-button icon="back">返回</mt-button>
        </router-link>
        <router-link to="/My" slot="left" class="my_router2">
        <mt-button>关闭</mt-button>
        </router-link>
  </mt-header>
  </div>
   <div v-for="(item,i) of list" :key="i">
<img :src="`http://127.0.0.1:3000/img/`+item.e_content_pic">
 </div>
</div>
</template>
<script>
export default {
  data(){
    return{
      list:[]
    }
  },
  methods: {
    myciku(){
    var eid=parseInt(this.$route.params.eid);
    var obj={eid:eid};
    this.axios.get("exp",{params:obj}).then(result=>{
      this.list=result.data;
    })
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
  img{
    width:100%;height:100%;
  }
  .my_router2{
    margin-left: 10px;
  }
</style>
