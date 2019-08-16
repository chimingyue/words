<template>
<div>
    <div>
            <div class="LBT">
                <mt-swipe :auto="3000" :show-indicators="true">
                    <mt-swipe-item>
                        <img src="http://127.0.0.1:3000/Lbt1.jpg" class="cimg"/>
                    </mt-swipe-item>
                    <mt-swipe-item>
                        <img src="http://127.0.0.1:3000/Lbt2.jpg" class="cimg"/>
                    </mt-swipe-item>
                    <mt-swipe-item>
                        <img src="http://127.0.0.1:3000/Lbt3.jpg" class="cimg"/>
                    </mt-swipe-item>
                </mt-swipe>
            </div>
        </div>
    <div class="xtb">
            <div @click="ty1()">
                <img src="http://127.0.0.1:3000/xz/662.png">
                <P>精品文章</P>
            </div>
            <div @click="ty1()">
                <img src="http://127.0.0.1:3000/xz/661.png">
                <p>活动</p>
            </div>
            <div @click="ty1()">
                <img src="http://127.0.0.1:3000/xz/663.png">
                <p>随身记</p>
            </div>
            <div @click="ty1()">
                <img src="http://127.0.0.1:3000/xz/664.png">
                <p>相关书籍</p>
            </div>
    </div>
    <div class="fgx"></div>
        <div class="title">
            大家都在看
        </div>
    <div class="look">
    <div class="lookk">
        <div v-for="(elem,i) of list" :key="i">
            <router-link :to="'/find/'+elem.n_id">
            <img :src="'http://127.0.0.1:3000/'+elem.n_pic"/>
            <span>{{elem.n_title}}</span>
            </router-link>
        </div>
    </div>
    </div>
    <div class="fgx"></div>
    <div class="title">
        随时记一点
    </div>
    <hr>
    <div class="lean">
        <div class="lean_title">
            <img src="http://127.0.0.1:3000/xz/text.png"/>
            <span>举个栗子</span>
            <div class="lean_a">
            <a href="https://so.m.jd.com/ware/search.action?keyword=%E5%9B%9B%E5%85%AD%E7%BA%A7%E8%8B%B1%E8%AF%AD%E8%AF%8D%E6%B1%87&searchFrom=home&sf=12&as=1">查看更多></a>
            </div>
        </div>
        <div class="lean_lang">
        <div v-for="(elem,i) of wlist" :key="i">
            <p>{{elem.example}}</p>
            <p>{{elem.example_means}}</p>
        </div>
        </div>
    </div>
</div>
</template>
<script>
import { swiper, swiperSlide } from 'vue-awesome-swiper'
export default {
    data(){
        return {
            list:[],
            wlist:[],
            //设置属性
            swiperOption:{
            //显示分页
            pagination: {
                el: '.swiper-pagination',
                clickable:true
            },
            //切换模式  横屏或者竖屏
            //direction : 'vertical',
            //设置自动播放速度
            autoplay: {
                disableOnInteraction: false,
                delay:4000
            },
            //开启无限循环
            loop:true,
            //设置点击箭头
            paginationClickable :true,
            prevButton:'.swiper-button-prev',
            nextButton:'.swiper-button-next',
            //设置同屏显示的数量，默认为1，使用auto是随意的意思。
            slidesPerView:1,
            //开启鼠标滚轮控制Swiper切换。可设置鼠标选项，或true使用默认值。
            mousewheel:false ,
            //默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动可能不止一格且不会贴合。
            //freeMode:true
        }
    }
    },
    components:{
        swiper,
        swiperSlide
    },
    methods:{
        loadMore(){
            var url="news";
            this.axios.get(url).then(result=>{
                this.list=result.data;
            }).catch(error => {
                    console.log(error);
            });
            var wid=parseInt(Math.random()*60);
            var wurl="word";
            var obj={
                wid
            }
            this.axios.get(wurl,{params:obj}).then(result=>{
                this.wlist=result.data;
            })
        },
        ty1(){
            this.$router.push("/back")
        }
    },
    created(){
        this.loadMore();
    }
}
</script>
<style scoped>
    .LBT{
        height:170px;
        width:100% !important;
        margin:1rem 0 0 0;
    }
    .cimg{
        width:100%;
        height:100%;
        border-radius:10px;
    }
    .xtb{
        display: flex;
        width: 100%;
        margin-bottom:2rem;
    }
    .xtb div{
        margin:0 auto;
        margin-top:0.5rem;
    }
    .xtb img{
        width:4rem;
        height:4rem;
        border-radius: 50%;
        background-color:#fff;
    }
    .xtb img+p{
        margin:0;
        padding:0;
        text-align:center;
        color:#4e4242;
        padding-top:0.5rem;
    }
    .xtb div a{
        text-decoration:none;
    }
    .fgx{
        height:0.5rem;
        background-color:#e8e8e8;
    }
    .look{
        display:flex;
        width:100%;
        height:435px;
    }
    .lookk{
        width:100%;
        margin-top:1rem;
        display:flex;
        justify-content:space-evenly;
        align-items:center;
        overflow:hidden;
        flex-flow:wrap;
    }
    .lookk div{
        width:43%;
        text-decoration:none;
        margin-bottom:10px;
        height:200px;
    }
    .look img{
        width:100%;
        height:160px;
    }
    .look span{
        font-size:15px;
        height:1rem;
        color:#000;
    }
    .title{
        margin:0.5rem 0 0 0;
        width:100%;
        height:30px;
        border-left:5px solid #0c8e75;
        font-size:21px;
        font-weight:bold;
    }
    .lean{
        width:100%;
        position:relative;
    }
    .lean_title{
        width:100%;
        height:42px;
        display:flex;
        padding-left:1rem;
    }
    .lean_title>span{
        font-size:17px;
        font-weight:bold;
        text-align:left;
        line-height:40px;
    }
    .lean_title>img{
        width:42px;
        height:42px;
    }
    .lean_a{
        width:100px;
        position:absolute;
        right:0;
        padding-top:10px;
    }
    .lean_a>a{
        text-decoration:none;
        color:#0c8e75
    }
    .last{
        text-align:right;
    }
    .lean p{
        margin-left:1rem;
        color:#000;
    }
    .lean_lang{
        width:100%;
        height:120px;
        overflow:hidden;
    }
</style>