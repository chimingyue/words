<template>
    <div class="all">
        <div class="firstContent">
            <h1 class="word">Hello,</h1>
            <div class="sentence">欢迎来到学霸</div>
            <div class="daily_bonus" @click="daily_bonus"
	        :class="daily_bonus_click_able?'can_clicked':'clicked'" >
                <span>
                    {{daily_bonus_text}}
                </span>
                <span>
                    {{num}}
                </span>
            </div>
    </div>
        <div class="secondContent">
            <div class="secondContentFlex">
                <div>
                    <p class="count">20</p>
                    <p class="words">新单词</p>
                </div>
                <div>
                    <p class="count">40</p>
                    <p class="words">今日需学</p>
                </div>
                <div>
                    <p class="count">40</p>
                    <p class="words">今日剩余</p>
                </div>
                <router-link to="">
                    <div>
                        <p class="count">40</p>
                        <p class="words">全部单词></p>
                    </div>
                </router-link>
            </div>
            <div class="secondContentButton" @click="study">
                <mt-button class="mybutton">开始背单词</mt-button>
            </div>
        </div>
        <div class="thirdContent">
            <div>
                <img :src="require('../assets/ic_speak.png')" />
                <p>口语</p>
            </div>
            <div>
                <img :src="require('../assets/ic_listen.png')" />
                <p>听力</p>
            </div>
            <div>
                <img :src="require('../assets/ic_read.png')" />
                <p>阅读</p>
            </div>
            <div>
                <img :src="require('../assets/ic_phrase.png')" />
                <p>短句</p>
            </div>
            <div>
                <img :src="require('../assets/ic_practise.png')" />
                <p>练习</p>
            </div>
        </div>
            <!--轮播-->
        <div>
            <div class="carouselWord">推荐课程>></div>
            <div class="carousel">
                <mt-swipe :auto="3000" :show-indicators="false" v-for="(item,i) of list" :key="i">
                    <mt-swipe-item>
                        <img  :src="'http://127.0.0.1:3000/carousel/'+list[0].picture" class="cimg"/>
                    </mt-swipe-item>
                    <mt-swipe-item>
                        <img  :src="'http://127.0.0.1:3000/carousel/'+list[1].picture" class="cimg"/>
                    </mt-swipe-item>
                    <mt-swipe-item>
                        <img  :src="'http://127.0.0.1:3000/carousel/'+list[2].picture" class="cimg"/>
                    </mt-swipe-item>
                    <mt-swipe-item>
                        <img  :src="'http://127.0.0.1:3000/carousel/'+list[3].picture" class="cimg"/>
                    </mt-swipe-item>
                    <mt-swipe-item>
                        <img  :src="'http://127.0.0.1:3000/carousel/'+list[4].picture" class="cimg"/>
                    </mt-swipe-item>
                </mt-swipe>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            uid:null,
            daily_bonus_text:"请登录",
            daily_bonus_click_able:false,
            num:null,
            date:"",
            last_year:2019,
            last_month:7,
            last_date:16,
            list:[]
        }
    },
    created() {
        var uid=sessionStorage.getItem("uid");
        console.log(uid)
        this.axios.get("car").then(result=>{
            this.list=result.data;
        });
        this.getdate();
    },
    methods: {
        getdate:function(){
            //请求user接口
            this.axios.get("user").then(result=>{
                var date=result.data[0].date;
                date=new Date(date);
                var last_year=date.getFullYear();
                this.last_year=last_year;
                var last_month=date.getMonth()+1;
                this.last_month=last_month;
                var last_date=date.getDate();
                this.last_date=last_date;
                var now=new Date();
                var now_year=now.getFullYear();
                var now_month=now.getMonth()+1;
                var now_date=now.getDate();
                if(date==null){
                    this.daily_bonus_click_able=true;
                }else if(now_date!==this.last_date || now_month!==this.last_month ||now_year!==this.last_year ){
                        this.daily_bonus_text="签到";
                        this.daily_bonus_click_able=true;
                        this.num=result.data[0].num;
                }else{
                    if(now_date==last_date){
                        this.num=result.data[0].num;
                        this.daily_bonus_click_able=false;
                        this.daily_bonus_text="已签到";
                    }
                }
            })
        },
        daily_bonus:function(){
            var uid=sessionStorage.getItem("uid");
            this.uid=uid;
            if(!uid){
                this.$messagebox.confirm("请登录").then(action=>{
                    if(action=="confirm"){
                        this.$router.push("/Login");
                    }
                }).catch(err=>{
                    console.log(err);
                });
            }else{
                //签到
                var daily_bonus_time=new Date();
                var date=daily_bonus_time.getTime();
                var daily_bonus_time_year=daily_bonus_time.getFullYear();
                var daily_bonus_time_month=daily_bonus_time.getMonth()+1;
                var daily_bonus_time_date=daily_bonus_time.getDate();
                if(daily_bonus_time_date!==this.last_date || daily_bonus_time_month!==this.last_month ||daily_bonus_time_year!==this.last_year ){
                    this.num++;//保存到页面上
                    var num=this.num;
                    var obj={date:date,num:num}
                    this.axios.get("upd",{params:obj}).then(result=>{
                        if(result.data.code==1){
                            this.num=num;
                            this.daily_bonus_text="已签到";
                            this.daily_bonus_click_able=false;
                            this.$toast({
                                message:"签到成功",
                                duration:1500
                            });
                            this.getdate();
                        }else{
                            this.$toast({
                                message:"请重试",
                                duration:1500
                            });
                        }
                    })
                }else{
                    this.$toast({
                        message:"今日已签到",
                        duration:1500
                    })
                }
            }

        },
        study:function(){
            //判断session
            var uid=sessionStorage.getItem("uid");
            if(uid){
                this.$router.push("/Study");
            }else{
                this.$messagebox.confirm("请登录").then(action=>{
                    if(action=="confirm"){
                        this.$router.push("/Login");
                    }
                }).catch(err=>{
                    console.log(err);
                });
            }
        }
    }   
}
</script>
<style scoped>
    .all{
          text-align:center;
    }
    .firstContent,.secondContent,.thirdContent{
        border-bottom:1px solid #b4b4b4;
        box-sizing:border-box;
    }
    .firstContent{
        height:180px;
        padding-top:25px;
        display:flex;
        flex-direction:column;
    }
    .sentence,.words,.thirdContent div p,.daily_bonus{
        color:#8a8a8a;
    }
    .sentence,.words,.thirdContent,.daily_bonus{
        font-size:0.7rem;
    }
    .secondContent{
        height:180px;
    }
    .secondContentFlex{
        height:65%;
        display:flex;
        justify-content:space-between;
        align-items:center; 
        padding-left:20px;
        padding-right:20px;
    }
    .secondContent div p{
        margin:0;
    }
    .secondContentButton{
        text-align:center;
    }
    .mybutton{
        padding:3px 10px 10px 3px;
    }
    p.count{
        font-size:1.2rem;
        font-weight:bold;
        color:#2c3e50;
    }
    .thirdContent{
        height:100px;
        display:flex;
        justify-content:space-between;
        align-items:center; 
        padding-left:20px;
        padding-right:20px;
        margin-bottom:5px;
    }
    .thirdContent img{
        width:30px;
        height:30px;
    }
    .thirdContent p{
        padding:0 !important;
        margin:0;
    }
    .cimg{
        border-radius:10px;
    }
    .carousel{
        height:150px;
    }
    .carouselWord{
        color:#8a8a8a;
        font-size:0.7rem;
        padding:10px 0;
    }
    .word{
        color:#0c8e75;
    }
    .sentence{
        margin-bottom:20px;
    }
    .daily_bonus{
        border:1px solid #8a8a8a;
        width:60px;
        margin:0 auto;
        border-radius:5px;
    }
    .can_clicked{
        color:#2c3e50;
        background-color:#0c8e75;
    }
    .clicked{
        color:#8a8a8a;
    }
</style>