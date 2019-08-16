<template>
    <div>
    <div v-for="(elem,i) of list" :key="i">
        <mt-header :title="elem.n_title" id="d1">
        <router-link to="/Home" slot="left">
        <mt-button icon="back" @click="tofind">返回</mt-button>
        </router-link>
        </mt-header>
    </div>
    <hr>
    <div class="all">
        <div v-for="(elem,i) of list" :key="i">
            <h4>{{elem.n_title}}</h4>
            <hr>
            <p>{{elem.n_subtitle}}</p>
            <img :src="'http://127.0.0.1:3000/'+elem.n_pic"/>
            <p>{{elem.n_content}}</p>
        </div>
    </div>
    </div>
</template>
<script>
export default {
    data(){return{
        list:[],
        title:[]
    }},
    methods:{
        geturl(){
            var nid=parseInt(this.$route.params.nid);
            var url="news";
            var obj={
                n_id:nid
            };
            this.axios.get(url,{params:obj}).then(result=>{
                this.list=result.data;
                console.log(this.list)
            }).catch(error => {
                    console.log(error);
            });
        },
        tofind(){
           sessionStorage.setItem("active","find");
           sessionStorage.setItem("isSelected","true");
        }
    },
    created(){
        this.geturl();
    }
}
</script>
<style>
    .all{
        width:100%;
        overflow:hidden;
    }
    img{
        width:100%;
    }
    h4{
        font-size:28px;
        text-align:center;
    }
    hr+p{
        font-weight:bold;
        font-size:20px;
        text-align:center;
    }
    img+p{
        padding-top:1rem;
        font-size:10px;
        color:#000;
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
</style>