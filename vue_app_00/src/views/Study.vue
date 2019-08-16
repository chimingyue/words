<template>
    <div class="container">
        <div class="titleNav">
            <div>
                <router-link to="Home">
                    <img :src="require('../assets/ic_index_normal.png')" @click="tohome"/>
                </router-link>
            </div>
            <div>正在学习</div>
            <div></div>
        </div>
        <!--单词学习-->
        <div class="vforlist">
            <div v-for="(item,i) of list" :key="i">
                <div class="wordTic">
                    <div class="word">{{item.word}}</div>
                    <div class="tic">{{item.phonetic}}</div>
                </div>
                <div class="means">
                    <div>{{item.means_adj}}</div>
                    <div>{{item.means_adv}}</div>
                    <div>{{item.means_n}}</div>
                    <div>{{item.means_v}}</div>
                    <div>{{item.means_prep}}</div>
                </div>
                <div class="example" v-if="example1%2!==0">
                    <div>例句</div>
                    <div>{{item.example}}</div>
                    <div>{{item.example_means}}</div>
                </div>
            </div>
        </div>      
        <!--上一个下一个查看详情-->
        <div class="isnext">
            <div @click="detail">
                <div class="detail">查看详情</div>
            </div>
            <div @click="before">
                <div class="before">上一个</div>
            </div>
            <div @click="next">
                <div class="next">下一个</div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            list:[],
            pno:0,
            ps:1,
            example:"",
            example1:0
        }
    },
    methods: {
        tohome(){
            sessionStorage.setItem("active","Home");
           sessionStorage.setItem("isSelected","true");
        },
        before(){
                this.pno--;
                var pno=this.pno;
                var ps=this.ps;
            if(pno>=1){
                var obj={pno:pno,ps:ps}
                this.axios.get("pagination",{params:obj}).then(result=>{
                this.list=result.data.data;
                this.example1=0;
                })
            }else{
                this.pno=1;
                this.$toast({
                    message:"已经是第一个了",
                    duration:1500
                });
            }
        },
        next(){
            this.pno++;
            var pno=this.pno;
            var ps=this.ps;
            if(pno<=41){
                var obj={pno:pno,ps:ps}
                this.axios.get("pagination",{params:obj}).then(result=>{    
                this.list=result.data.data;
                })
            }else{
                this.$toast({
                    message:"今日学习计划已完成，请小主歇息吧",
                    duration:1500
                });
                this.pno=41;
            }
            this.example1=0;
        },
        detail(){
            this.example1++;
        }
    },
    created() {
        this.next(); 
    },
}
</script>
<style scoped>
    .titleNav{
        display:flex;
        justify-content:space-between;
        align-items:center;
        padding:0 10px 0 10px;
        color:#8a8a8a;
    }
    .titleNav img{
        width:20px;
        height:20px;
    }
    .titleNav div{
        font-size:0.8rem;
    }
    .vforlist{
        padding:20px 10px 0 10px;
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
    .container{
        position:relative;
    }
    .isnext{
        position:fixed;
        bottom:0px;
        display:flex;
        flex-direction:column; 
    }
    .next,.detail,.before{
        color:#fff;
        font-size:0.9rem;
    }
    .next,.before{
        margin-bottom:5px !important;  
    }
    .detail{
        margin-bottom:5px !important;
    }
    .detail,.next,.before{
        width:355px;
        height:30px;
        margin:0 auto;
        background-color:#0c8e75;
        text-align:center;
        line-height:30px;
    }
</style>