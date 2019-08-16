<template>
    <div>
    <mt-header title="Python编程" id="d1">
        <router-link to="/home" slot="left">
        <mt-button icon="back" @click="tomyclass">返回</mt-button>
        </router-link>
  </mt-header>
    
        <div>
            <img src="http://127.0.0.1:3000/xz/Python1.gif"/>
            <img src="http://127.0.0.1:3000/xz/Python2.jpg"/>
            <img src="http://127.0.0.1:3000/xz/Python3.jpg"/>
            <img src="http://127.0.0.1:3000/xz/Python4.jpg"/>
            <img src="http://127.0.0.1:3000/xz/Python5.jpg"/>
        </div>
    </div> 
</template>
<script>
export default {
    data(){return{
        
    }},
    methods: {
        tomyclass(){
            sessionStorage.setItem("active","class");
            sessionStorage.setItem("isSelected","true");
        }
    },
}
</script>
<style scoped>
    img{
        width:100%;
        vertical-align:top;
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