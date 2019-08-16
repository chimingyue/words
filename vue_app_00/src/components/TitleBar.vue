<template>
    <div>
        <div class="head">
            <div>
                <mt-field id="field"  :placeholder="Holder" 
                v-model="word" ></mt-field>
            </div>
            <div class="searchdiv" @click="search">
                <img :src="require('../assets/ic_search.png')" style="width:20px;" class="searchimg"/>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            Holder:"查词",
            word:"",
        }
    },
    methods: {
         search(){
             if(!this.word){
                 this.$toast({
                     message:"请输入要查询的内容",
                     position:"top",
                     duration:1500
                 });
             }else{
                 var obj={word:this.word};
                 console.log(this.word);
                 this.axios.get("sel",{params:obj}).then(result=>{
                    if(result.data.code==-1){
                        this.$toast({
                        message:"抱歉，未查询到相关内容",
                        position:"top",
                        duration:1500
                        });
                     }else{
                        sessionStorage.setItem("word",`${this.word}`);
                        this.$router.push("/Select");
                    }
                 })
             }
         }
    }
}
</script>
<style scoped>
    .head{
        position:relative;
    }
    .head .searchdiv img{
        position:absolute;
        top:15px;
        right:30px;
    }
</style>