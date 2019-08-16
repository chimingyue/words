<template>
    <div>
    <div>
            <mt-navbar v-model="selected" @click="ty4">
        <mt-tab-item id="1">推荐</mt-tab-item>
        <mt-tab-item id="2">
        <div @click="ty1">考试</div>
        </mt-tab-item>
        <mt-tab-item id="3">
         <div @click="ty2">阅读</div>
        </mt-tab-item>
        <mt-tab-item id="4">
        <div @click="ty3">听力口语</div>
        </mt-tab-item>
        <mt-tab-item id="5">
        <div @click="ty4">Python编程</div>
        </mt-tab-item>
            </mt-navbar>
    </div>
        <div class="suibian">
    <mt-tab-container v-model="selected">
        <mt-tab-container-item id="1">
            <div v-for="(elem,i) of list" :key="i" class="sy">
            <router-link :to="'/news/'+elem.cid">
                <img :src="'http://127.0.0.1:3000/xz/'+elem.c_img"/>
                <h6>{{elem.title}}</h6>
                <span>{{elem.price}}</span>
            </router-link>
            </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="2">
            <div v-for="(elem,i) of list1" :key="i" class="sy">
            <router-link :to="'/news/'+elem.cid">
                <img :src="'http://127.0.0.1:3000/xz/'+elem.c_img"/>
                <h6>{{elem.title}}</h6>
                <span>{{elem.price}}</span>
            </router-link>
            </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="3" @click="ty2">
            <div v-for="(elem,i) of list2" :key="i" class="sy">
            <router-link :to="'/news/'+elem.cid">
                <img :src="'http://127.0.0.1:3000/xz/'+elem.c_img"/>
                <h6>{{elem.title}}</h6>
                <span>{{elem.price}}</span>
            </router-link>
            </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="4" @click="ty3">
            <div v-for="(elem,i) of list3" :key="i" class="sy">
            <router-link :to="'/news/'+elem.cid">
                <img :src="'http://127.0.0.1:3000/xz/'+elem.c_img"/>
                <h6>{{elem.title}}</h6>
                <span>{{elem.price}}</span>
            </router-link>
            </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="5">
        </mt-tab-container-item>
    </mt-tab-container>
        </div>
    </div>
</template>
<script>

export default {
    data(){return{
        list:[],
        list1:[],
        list2:[],
        list3:[],
        selected:"1",
    }},
    methods: {
        loadMore(){
            var url="course";
            this.axios.get(url).then(result=>{
                this.list=result.data;
            }).catch(error => {
                    console.log(error);
            });
        },
        ty1(){
            var url="cour";
            var obj={
                c_type:1
            };
            this.axios.get(url,{params:obj}).then(result=>{
                this.list1=result.data;
            }).catch(error => {
                    console.log(error);
            });
        },
        ty2(){
            var url="cour";
            var obj={
                c_type:2
            };
            this.axios.get(url,{params:obj}).then(result=>{
                this.list2=result.data;
            }).catch(error => {
                    console.log(error);
            });
        },
        ty3(){
            var url="cour";
            var obj={
                c_type:3
                
            };
            this.axios.get(url,{params:obj}).then(result=>{
                this.list3=result.data;
            }).catch(error => {
                    console.log(error);
            });
        },
        ty4(){
            //window.location.replace("http://127.0.0.1:8080/#/Python");
            this.$router.push("/Python")
        },
    },
    created() {
        this.loadMore();
    },
}
</script>
<style scoped>
    .mint-navbar .mint-tab-item{
        font-weight:bold !important;
    }
    h6{margin:0 0;
    font-size:0.7rem;
    color:#000;};
    .suibian{display:flex;}
    .mint-tab-container-item{
        margin-top:1rem;
        display:flex;
        justify-content:space-evenly;
        align-items:center;
        overflow:hidden;
        flex-flow:wrap;
    }
    img{width:100%;height:130px}
    .sy{
    width:43%;
    text-decoration:none;
    margin-bottom:10px;
    }
    span{
        font-size:0.75rem;
        font-weight:bold;
        color:#0c8e75;
    }
    h6{
        height:32px;
    }
    .mint-tab-item-label div{
        color:#0c8e75 !important;
    }
</style>