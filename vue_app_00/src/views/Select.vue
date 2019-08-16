<template>
    <div class="container">
        <router-link to="Home">
            <div class="cancel" @click="tohome">取消</div>
        </router-link>
        <!--查询结果-->
        <div class="result">
            <div class="wordTic">
                <div class="word" v-text="list[0].word"></div>
                <div class="tic" v-text="list[0].phonetic"></div>
            </div>
            <div class="means">
                <div v-text="list[0].means_adj"></div>
                <div v-text="list[0].means_adv"></div>
                <div v-text="list[0].means_n"></div>
                <div v-text="list[0].means_v"></div>
                <div v-text="list[0].means_prep"></div>
            </div>
            <div class="example">
                <div>例句</div>
                <div v-text="list[0].example"></div>
                <div v-text="list[0].example_means"></div>
            </div>   
        </div>
        <!--没有查询结果-->
    </div>
</template>
<script>
export default {
    data(){
        return {
            list:[],
        }
    },
    methods: {
        tohome(){
            sessionStorage.setItem("active","home");
           sessionStorage.setItem("isSelected","true");
        }
    },
    created(){
        var word=sessionStorage.getItem("word");
        var obj={word:word};
        this.axios.get("sel",{params:obj}).then(result=>{
            this.list=result.data;
        });
    }
}
</script>
<style scoped>
    .container{
        padding:7px;
    }
    .wordTic{
        height:50px;
        display:flex;
        align-items:center;
        flex-wrap:wrap;
    }
    .wordTic .word{
        color:#0c8e75;
        font-size:2rem;
        margin-right:30px;
    }
    .wordTic .tic{
        font-size:1rem;
        padding-top:5px;
    }
    .means,.example{
        display:flex;
        flex-direction:column;
        text-align:left;
        margin:10px 0;
        font-size:0.8rem;
    }
    .means div,.example div{
        margin :5px 0;
    }
    .example div:first-child{
        color:#8a8a8a;
    }
    .cancel{
        text-align:left;
        color:#8a8a8a;
        font-size:0.8rem;
        margin-bottom:10px;
    }
</style>