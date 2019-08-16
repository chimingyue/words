<template>
  <div class=my_container>
    <div class="myImgs">
    <div class="myImg" @click="my_xiugai" v-for="(elem,i) of list" :key="i">
      <img :src="'http://127.0.0.1:3000/'+elem.avatar" class="Imgstyle">
    </div>
      <div class="myName" @click="my_xiugai">
        <span style="font-size:20px" class="sname" ><strong>{{uname}}</strong></span>
        <span style="color:#989898" class="ssignature">个性签名:{{signature}}</span>
      </div>
      </div> 
   <div class="my_danciImg">
     <router-link to="/book" slot="left"><img src="../../assets/book1.png" alt=""></router-link>
     <router-link to="/CiKu" slot="left"><img src="../../assets/book3.png" alt=""></router-link>
     <img src="../../assets/zoushi.png" alt="">
     <img src="../../assets/pinjie.png" alt="">
   </div>
   <div class="p1">
     <router-link to="/book" slot="left" class="danciA"><p>单词本</p></router-link>
     <router-link to="/CiKu" slot="left" class="danciA"><p>我的词库</p></router-link>
     <router-link to="/book" slot="left" class="danciA"><p>学习进度</p></router-link>
    <router-link to="/tuoZhan" slot="left" class="danciA"><p>拓展包</p></router-link>
   </div>
    <div class="mydaka">
     <div class="daka">
        <img src="../../assets/rili.png" alt="" class="myrili">
        <div class="s1">
        <span class="s1span">连续打卡{{num}}天</span>
        </div>
        </div>
     </div>
      <div class="myshengciben1">
     <div class="shengciben">
       <span class="shengciben_span">
         生词本
         </span>
       <img src="../../assets/youjian.png" alt="" class="myshengciben">
     </div>
     </div>

        <div class="kecheng1">
          <div class="kecheng">
            <span>课程</span>
            <img src="../../assets/youjian.png" alt="">
          </div>

          <div class="kecheng">
            <span>贝壳</span>
            <img src="../../assets/youjian.png" alt="">
          </div>
          <div class="kecheng">
            <span>兑换</span>
            <img src="../../assets/youjian.png" alt="">
          </div>
          <div class="kecheng">
            <span>活动</span>
            <img src="../../assets/youjian.png" alt="">
          </div>
          </div>

            <div class="xiaoxizhongxin">
          <div class="myxiaoxizhongxin">
       <span class="xiaoxizhongxin_span">消息中心</span>
       <img src="../../assets/youjian.png" alt="" class="myshengciben">
     </div>
       </div>

        <div class="my_zhognxin">
          <div class="myxiaoxizhongxin">
       <span class="xiaoxizhongxin_span">设置</span>
       <img src="../../assets/youjian.png" alt="" class="myshengciben">
     </div>
     </div>
     <mt-button type="danger" size="large" @click="my_tuichu" class="my_tui">退出登录</mt-button>
    </div>
    
</template>
<script>
export default {
  data(){
    return{
      uname:"",
      signature:"",
      num:"",
      list:[]
    }
  },
  methods: {
     my_tuichu(){
       this.$messagebox.confirm("确认执行操作").then(action=>{
         sessionStorage.removeItem("uid");
         this.$router.push("/Login");
       }).catch(err=>{console.log(err)})
   },
    my_xiugai(){
    this.$router.push("/Edit")
  },
    loadMore(){
      var u=this.umame;
      var s=this.signature;
      var n=this.num;
      var a=this.avatar;
      var url="user";
      var obj={uname:u,sigmature:s,num:n,avatar:a};
      this.axios.get("user",{params:obj}).then(result=>{
        this.uname=result.data[0].uname;
        this.signature=result.data[0].signature;
        this.num=result.data[0].num;
        this.list=result.data;
      })
    }
  },
  created() {
    this.loadMore();
  },
  
}
</script>
<style scoped>
 .myImg{
   width:80px;height:80px;
   border:1px solid #ddd;
   border-radius: 50%;
   margin: 40px 0 20px 20px;
   }
   .Imgstyle{
     background-repeat:no-repeat;
     border-radius: 50%;
     width:80px;height:80px;
   }
   .myName{
     display: flex;
     flex-direction: column;
     justify-content: center;
  margin-top:15px;
  margin-left:5px;
   }
   .myImgs{
     display: flex;
     border-bottom: 5px solid #ddd;
   }
   .sname{
     display: flex;
   }
   .ssignature{
     display: flex;
     text-overflow:ellipsis; white-space: nowrap;
     width:250px;height:20px; 
     overflow: hidden;
      margin-top:5px;
      font-size:12px;
   }
   .my_danciImg{
     display: flex;
     justify-content:space-around;
     margin-top:10px;
   }
   .my_danciImg img{
     width:25px;height:25px;
   }
   .p1{
     display: flex;
     justify-content:space-around;
     font-size:0.2rem;
     color:#707070;
     border-bottom: 5px solid #ddd;
   }
   .daka,.shengciben,.myxiaoxizhongxin{
      display: flex; 
     justify-content: space-between;
     margin:-2px 5px 5px 5px; 
    
   }
   .mydaka,.myshengciben1{
    border-bottom: 5px solid #ddd;
   }
   .myrili,.myshengciben{
     width:30px;height:30px;
     margin-top:10px;
   }
   .myrili{
     margin-left:10px;
   }
   .s1{
     display: flex;
     align-items: center;
   }
   .s1span{
     font-size:0.7rem;
     color:#8a8a8a;
     font-weight: bold;
     margin-top:7px;
   }
   .shengciben_span,.xiaoxizhongxin_span{
     font-size:14px;
     color:#8a8a8a;
     margin:15px 0 0 14px;
   }
   .kecheng{
     display: flex;
     align-items: center;
     justify-content: space-between;
   }
   .kecheng img{
     width:30px;height:30px;
    
   }
   .kecheng1,.xiaoxizhongxin{
 border-bottom: 5px solid #ddd;
   }
   .kecheng span{
     color:#8a8a8a;
     font-size:14px;
     margin:20px;
   }
   .kecheng img{
     margin-right: 5px;
   }
   .danciA{
     text-decoration: none;
     color:#8a8a8a;
     margin:0;
     padding:0;
   }
 

</style>