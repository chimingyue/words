<template>
  <div class="reg_container">
    <div>
      <h3>欢迎来到学霸</h3>
      <h4>请注册</h4>
    </div>
     <div>
       <mt-field label="用户名" placeholder="请输入用户名" v-model="uname"></mt-field>
      <mt-field label="密码" placeholder="请输入6~18位密码" type="password" v-model="upwd"></mt-field>
       <mt-field label="邮箱" placeholder="请输入邮箱" type="email" v-model="email"></mt-field>
      <mt-field label="手机号" placeholder="请输入11位手机号" type="tel" v-model="phone"></mt-field>
     </div>
     <mt-button type="primary" size="large" class="mybutton" @click="rreg">提交</mt-button>
     <div class="reg_denglu" @click="my_btn">
       <span>已有学霸账号,去登录</span>
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
      phone:""
      }
  },
  methods: {
    rreg(){
      var un=this.uname;
      var up=this.upwd;
      var em=this.email;
      var ph=this.phone;
      var run=/^[a-z0-9_]{3,12}$/i;//用户名验证
      var rup=/^[a-zA-Z0-9]\w{6,18}$/;//英文、数字包括下划线
      var rem=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      var rph=/^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
      if(!run.test(un)){
        this.$toast("用户名格式有误");
        return;
      };
      if(!rup.test(up)){
        this.$toast("密码格式有误");
        return;
      };
      if(!rem.test(em)){
        this.$toast("邮箱格式有误");
        return;
      };
      if(!rph.test(ph)){
        this.$toast("手机号格式有误");
        return;
      };
      var url="reg";
      var obj={uname:un,upwd:up,email:em,phone:ph};
      this.axios.get(url,{params:obj}).then(result=>{
        this.$router.push("/Login")
      })
    },
    my_btn(){
      this.$router.push("/Login");
    }

  },
  created() {
  },
}
</script>.
<style scoped>
  .mybutton{
    margin-top:10px;
    background-color:#0c8e75;
  }
  .reg_container{
    margin-top:150px;

  }
  .reg_denglu{
    font-size: 12px;
     margin-top:10px;
      float: right;
      margin-right:5px;
  }
</style>