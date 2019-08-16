<template>
  <div>
    <div class="myciku">
    <mt-header title="" id="d1">
        <router-link to="/My" slot="left">
        <mt-button icon="back">修改个人资料</mt-button>
        </router-link>
         <mt-button icon="" slot="right">
            <img src="../../assets/duihao.png" alt="" class="edit_img"  @click="edit_xiugai">
         </mt-button>
  </mt-header>
   </div> 
   <div class="edit_touxiang1">
      <div class="edit_touxiang">
        <img src="../../assets/touxiang.png" alt="">
        </div>
        <div class="edit_span">
          <span>修改头像></span>
        </div>
      </div>
      <div class="nicheng">
          <mt-field label="昵称:" placeholder="请输入新用户名" v-model="uname" ></mt-field>
      </div>
      <div class="nicheng">
          <mt-field label="密码:" placeholder="请输入新密码" v-model="upwd" ></mt-field>
      </div>
      <div class="nicheng">
          <mt-field label="邮箱:" placeholder="请输入新邮箱" v-model="email"></mt-field>
      </div>
      <div class="nicheng">
          <mt-field label="手机号:" placeholder="请输入新手机号" v-model="phone"></mt-field>
      </div>
      <div class="jieshao">
          <mt-field label="自我介绍:" placeholder="自我介绍" type="textarea" rows="4" v-model="signature"></mt-field>
      </div>

  </div>
</template>
<script>
export default {
  data(){
    return{
      uname:"",
      upwd:"",
      email:"",
      phone:"",
      signature:""
    }
  },
  methods: {
   edit_xiugai(){
     var u=this.uname;
     var p=this.upwd;
     var em=this.email;
     var ph=this.phone;
     var si=this.signature;
     var obj={uname:u,upwd:p,email:em,phone:ph,signature:si}
     this.axios.get("update",{params:obj}).then(result=>{
          if(result.data.code==200){
            this.$router.push("/My")
          }else{
            this.$toast("修改失败")
          }
          
     })
   }
  },
  created() {
    
  },
}
</script>
<style scoped>
   #d1{
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
.edit_img{
  width:20px;height:20px;
  margin-top:10px;
}
 .edit_touxiang1{
   display: flex;
  justify-content: space-between; 
} 
.edit_touxiang{
   margin:20px 0 20px 20px;
  width:80px;height:80px;
  border:1px solid #8a8a8a;
  border-radius: 50%
}
.edit_touxiang>img{
  width:70px;height:70px;
}
.edit_span{
font-size:13px;
color:#8a8a8a;
margin:40px 10px 0 0;
}

</style>