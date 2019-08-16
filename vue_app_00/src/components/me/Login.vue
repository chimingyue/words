<template>
  <div class="Login_container">
    <div>
      <h3>欢迎来到学霸</h3>
      <h4>请登录</h4>
    </div>

      <div>
        <mt-field label="用户名" placeholder="请输入用户名" v-model="uname"></mt-field>
        <mt-field label="密码" placeholder="请输入密码" type="password" v-model="upwd"></mt-field>
      </div>
      <mt-button type="primary" size="large" class="mybutton" @click="login">登录</mt-button>
      <div class="my_zhuce" @click="myzhuce">
        <span>还没有学霸账号?去注册</span>
      </div> 
  </div>
</template>
<script>
export default {
  data(){
    return{
      uname:"",
      upwd:""
    }
  },
  methods: {
    login(){
      var u=this.uname;
      var p=this.upwd;
      var reg=/^[a-z0-9_]{3,12}$/i;
      var regg=/^\w{6,18}$/;//英文、数字包括下划线
      if(!reg.test(u)){
        this.$toast({
          message:"用户名格式不正确",
          position:"top",
          className:"my",
          duration:3000
          });
        return;
      };
       if(!regg.test(p)){
        this.$toast({
          message:"密码格式不正确",
         position:"top"
          });
        return;
      };
       var url="login";
       var obj={uname:u,upwd:p};
        this.axios.get(url,{params:obj}).then(result=>{
          if(result.data.code==1){
            var uid=result.data.result[0].uid
            sessionStorage.setItem("uid",uid);
         this.$router.push("/Home");
         }else{
           this.$toast("用户名或密码有误");
         }
        })
    },
    myzhuce(){
      this.$router.push("/register")
    }
   
  },
  created() {
    
  },
}
</script>
<style scoped>
  .mybutton{
    margin-top:10px;
    background-color:#0c8e75;
  }
   .Login_container{
     margin-top:150px;
   }
    .my_zhuce{
      font-size:12px;
      margin-top:10px;
      float: right;
      margin-right:5px;
    }
</style>