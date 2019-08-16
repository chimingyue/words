<template>
    <div class="home-container">
        <div class="page-wrap">
            <!-- 顶部导航栏 -->
            <titlebar></titlebar>
            <!--首页内容,  四个面板组件切换 -->
            <mt-tab-container v-model="active">
                <mt-tab-container-item id="index">
                    <context></context>
                </mt-tab-container-item>
                <mt-tab-container-item id="class">
                    <Myclass></Myclass>
                </mt-tab-container-item>
                <mt-tab-container-item id="find">
                    <find></find>
                </mt-tab-container-item>
                <mt-tab-container-item id="my">
                    <My></My>
                </mt-tab-container-item>
            </mt-tab-container>
            <!--底部导航 tabbar-->
            <mt-tabbar v-model="active" fixed> 
                <mt-tab-item id="index" @click.native="changeState(0)">
                    <tabbaricon 
                    :selectedImage="require('./assets/ic_index_selected.png')"
                    :normalImage="require('./assets/ic_index_normal.png')"  
                    :focused="currentIndex[0].isSelected"
                    >
                    </tabbaricon>
                    背单词
                </mt-tab-item>
                <mt-tab-item id="class" @click.native="changeState(1)">
                    <tabbaricon 
                    :selectedImage="require('./assets/ic_class_selected.png')"
                    :normalImage="require('./assets/ic_class_normal.png')"  
                    :focused="currentIndex[1].isSelected"
                    >
                    </tabbaricon>
                    课程
                </mt-tab-item>
                <mt-tab-item id="find" @click.native="changeState(2)">
                    <tabbaricon 
                    :selectedImage="require('./assets/ic_find_selected.png')"
                    :normalImage="require('./assets/ic_find_normal.png')"  
                    :focused="currentIndex[2].isSelected"
                    >
                    </tabbaricon>
                    发现
                </mt-tab-item>
                <mt-tab-item id="my" @click.native="changeState(3)">
                    <tabbaricon 
                    :selectedImage="require('./assets/ic_me_selected.png')"
                    :normalImage="require('./assets/ic_me_normal.png')"  
                    :focused="currentIndex[3].isSelected"
                    >
                    </tabbaricon>
                    我的
                </mt-tab-item>
            </mt-tabbar>    
        </div>
    </div>
</template>
<script>
import TitleBar from './components/TitleBar.vue'
import TabBarIcon from './components/TabBarIcon.vue'
import Context from './views/Context.vue'
import Myclass from './components/myclass/Myclass.vue'
import find from './components/myclass/find.vue'
import My from './components/me/My.vue'
export default {
    data(){
        return {
            active:"index",
            currentIndex:[
                {isSelected:true},
                {isSelected:false},
                {isSelected:false},
                {isSelected:false}
            ]
        }
    },
    methods: {
        changeState(n){
            for(var i=0;i<this.currentIndex.length;i++){
                if(n==i){
                    this.currentIndex[i].isSelected=true;
                }else{
                    this.currentIndex[i].isSelected=false;
                }
            }
        }
    },
    created() {
        var value=sessionStorage.getItem("active");
        var isSelected=sessionStorage.getItem("isSelected");
        if(value=="class"){
            this.active=value;
            this.currentIndex[1].isSelected=isSelected;
            this.currentIndex[0].isSelected=false;
            this.currentIndex[2].isSelected=false;
            this.currentIndex[3].isSelected=false;
        }
        if(value=="find"){
            this.active=value;
            this.currentIndex[2].isSelected=isSelected;
            this.currentIndex[0].isSelected=false;
            this.currentIndex[1].isSelected=false;
            this.currentIndex[3].isSelected=false;
        }
        if(value=="my"){
            this.active=value;
            this.currentIndex[3].isSelected=isSelected;
            this.currentIndex[0].isSelected=false;
            this.currentIndex[1].isSelected=false;
            this.currentIndex[2].isSelected=false;
        }
    },
    components:{
        "titlebar":TitleBar,
        "tabbaricon":TabBarIcon,
        "context":Context,
        "Myclass":Myclass,
        "find":find,
        "My":My
    }
}
</script>
<style scoped>
    .home-container{
        overflow:hidden;
    }
    .page-wrap{
        overflow:auto;
        padding-bottom:80px;
    }
    .mint-tabbar>.mint-tab-item{
        color:#999999;
    }
    .mint-tabbar>.mint-tab-item.is-selected{
        background-color:transparent;
        color:#0c8e75;  
    }
    .mint-tabbar.is-fixed{
        font-size:8px;
    }
</style>