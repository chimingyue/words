<template>
  <div>
  <div v-for="(elem,i) of list" :key="i">
        <mt-header :title="elem.title" id="d1">
        <router-link to="/Home" slot="left">
        <mt-button icon="back" @click="tomyclass">返回</mt-button>
        </router-link>
        </mt-header>
    </div>
    <div v-for="(elem,i) of list" key="i">
        <img :src="'http://127.0.0.1:3000/xz/'+elem.video"/>
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
    methods:{
        geturl(){
            var cid=parseInt(this.$route.params.cid);
            var url="cour";
            var obj={
                cid:cid
            };
            this.axios.get(url,{params:obj}).then(result=>{
                this.list=result.data;
                console.log(this.list)
            }).catch(error => {
                    console.log(error);
            });
        },
        tomyclass(){
            sessionStorage.setItem("active","class");
            sessionStorage.setItem("isSelected","true");
        }
    },
    created(){
        this.geturl();
    }
}
</script>
<style scoped>
    img{
        width:100%;
    }
</style>
