//1:引入第三方模块
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
const bodyParser=require('body-parser');
//2:配置第三方模块
 //2.1:配置连接池
 var pool = mysql.createPool({
   host:"127.0.0.1",
   user:"root",
   password:"",
   port:3306,
   database:"words",
   connectionLimit:15
 })
 
 var server = express();
 server.use(express.static('public'));
 //使用body-parser中间件，将post请求的数据格式化为对象
 server.use(bodyParser.urlencoded({
  extended:false
}));
//2.2:跨域
 server.use(cors({
   origin:["http://127.0.0.1:8080",
   "http://localhost:8080"],
   credentials:true
 }))
 //2.3:session
 server.use(session({
   secret:"128位字符串",
   resave:true,
   saveUninitialized:true
 }))
 server.listen(3000);


//功能一：登录
server.get("/login",(req,res)=>{
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  if(!uname){
      res.send({code:-1,msg:"用户名不能为空"});
      return;
    }
    if(!upwd){
      res.send({code:-1,msg:"密码不能为空"});
      return;
    }
  var sql="SELECT uid FROM w_user WHERE uname=? AND upwd=?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码有误"});
   }else{
    req.session.uid=result[0].uid;
    res.send({code:1,result:result});
   }
  })
});

//功能二：注册
server.get("/reg",(req,res)=>{
  var obj=req.query;
  var sql="INSERT INTO w_user SET ?";
  pool.query(sql,[obj],(err,result)=>{
    if(err) throw err;
    var error=400;
    for(var key in obj){
      error++;
      if(!obj[key]){
      res.send({code:error,msg:key+' required'});
      return;
      }
    }
    if(result.affectedRows>0){
      res.send({code:1,msg:"注册成功"});
   }else{
     res.send({code:-1,msg:"注册失败"});
   }
  });
});

//功能三：查看单词
server.get("/word",(req,res)=>{
  var obj=req.query.wid;
  if(!obj){
  var sql="SELECT * FROM w_words"
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    //console.log(result);
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  })}else{
    var sql="SELECT * FROM w_words WHERE wid=?"
    pool.query(sql,[obj],(err,result)=>{
      if(err) throw err;
      //console.log(result);
      if(result.length>0){
        res.send(result);
      }else{
        res.send({code:-1,msg:"查询失败"});
      }
    })
  }

});

//功能四：查看课程
server.get("/course",(req,res)=>{
  var sql="SELECT * FROM course"
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    //console.log(result);
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  });
});

//功能五：搜索框查看单词
server.get("/sel",(req,res)=>{
  var word=req.query.word;
  if(!word){
      res.send({code:-1,msg:"搜索内容为空"});
      return;
    }
  var sql="SELECT * FROM w_words WHERE word LIKE '%"+word+"%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  });
});

//功能六：修改用户信息
server.get("/update",(req,res)=>{
  var obj=req.query;
  var uid=req.session.uid;
  var error=400;
  for(var key in obj){
	error++;
    if(!obj[key]){
	  res.send({code:error,msg:key+"不能为空"});
	  return;
	  }
  }
  var sql="UPDATE w_user SET uname=?,upwd=?,email=?,phone=?,gender=?,signature=? WHERE uid=?";
    pool.query(sql,[obj.uname,obj.upwd,obj.email,obj.phone,obj.gender,obj.signature,uid],function(err,result){
      if(err) throw err;
	    if(result.affectedRows>0){
	      res.send({code:200,msg:"修改成功"});
	    }else{
	      res.send({code:301,msg:"修改失败"});
	    }
    });
});

//功能七：查看不同类型的课程
server.get("/cour",(req,res)=>{
  if(!req.query.cid){
    var c_type=req.query.c_type;
    var sql="SELECT * FROM course WHERE c_type=?"
    pool.query(sql,[c_type],(err,result)=>{
      if(err) throw err;
      //console.log(result);
      if(result.length>0){
        res.send(result);
      }else{
        res.send({code:-1,msg:"查询失败"});
      }
    });
  }else if(!req.query.c_type){
    var cid=req.query.cid;
    var sql="SELECT * FROM course WHERE cid=?"
    pool.query(sql,[cid],(err,result)=>{
      if(err) throw err;
      //console.log(result);
      if(result.length>0){
        res.send(result);
      }else{
        res.send({code:-1,msg:"查询失败"});
      }
    });
  }
});

//功能八：单词分页
server.get("/pagination",(req,res)=>{
  //1.参数
  var pno=req.query.pno;
  var ps=req.query.pageSize;
  //2.设置默认值
  if(!pno){pno=1;}
  if(!ps){ps=1;}
  //3.创建两条sql语句执行 嵌套完成
  var obj={code:1,msg:"查询成功"};
  var sql="SELECT* FROM w_words LIMIT ?,?";
  var off=(pno-1)*ps;
  ps=parseInt(ps);
  pool.query(sql,[off,ps],(err,result)=>{
    if(err) throw err;
    obj.data=result;
    var sql="SELECT COUNT(*) AS c FROM w_words";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      var pc=Math.ceil(result[0].c/ps);
      obj.pc=pc;
      res.send(obj);
    });
  });
});

//功能九：用户信息查询
server.get("/user",(req,res)=>{
  var uid=req.session.uid;
    if(!uid){
      res.send({code:-1,msg:"id为空"});
      return;
  }
  var sql="SELECT * FROM w_user WHERE uid=? ";
  pool.query(sql,uid,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"用户信息查询失败"});
    }
  })
});

//功能十："大家都在看"信息查询
server.get("/news",(req,res)=>{
  var nid=req.query.n_id;
  if(nid){
    var sql="SELECT * FROM news WHERE n_id=?";
    pool.query(sql,nid,(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        res.send(result);
        console.log(result);
      }else{
        res.send({code:-1,msg:"查询失败"});
      }
    });
  }else{
    var sql="SELECT * FROM news";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        res.send(result);
        console.log(result);
      }else{
        res.send({code:-1,msg:"查询失败"});
      }
    });
  }
});


//功能十一：扩展包信息查询
server.get("/expansion",(req,res)=>{
  var sql="SELECT * FROM expansion";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  }) 
});
server.get("/exp",(req,res)=>{
  var eid=req.query.eid;
  var sql="SELECT e_content_pic FROM expansion WHERE eid=?";
  pool.query(sql,eid,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  }) 
});

//功能十二：轮播图
server.get("/car",(req,res)=>{
  var sql="SELECT picture FROM carousel";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  })
});

//功能十三：打卡
//查询数据库中的打卡时间和打卡天数
server.get("/date",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
      res.send({code:-1,msg:"uid为空"});
      return;
  }
  var sql="SELECT date,num FROM w_user WHERE uid=?";
  pool.query(sql,uid,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  })
});
//修改数据库中的打卡时间和打卡天数
server.get("/upd",(req,res)=>{
  var uid=req.session.uid;
  var obj=req.query;
  if(!uid){
    res.send({code:-1,msg:"uid为空"});
    return;
  }
  var sql="UPDATE w_user SET date=?,num=? WHERE uid=?";
  pool.query(sql,[obj.date,obj.num,uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"修改成功"});
    }else{
      res.send({code:-1,msg:"修改失败"});
    }
  });
}); 