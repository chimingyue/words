SET NAMES UTF8;
DROP DATABASE IF EXISTS words;
CREATE DATABASE words CHARSET=UTF8;
USE words;

/**用户信息**/
CREATE TABLE w_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),          #用户名
  upwd VARCHAR(32),           #密码
  email VARCHAR(64),          #邮箱
  phone VARCHAR(16),          #电话
  avatar VARCHAR(128),        #头像图片路径
  gender INT,                 #性别  0-女  1-男
  signature VARCHAR(256),     #个性签名
  date BIGINT,                #打卡日期
  num INT                     #打卡天数
);

/**单词信息**/
CREATE TABLE w_words(
  wid INT PRIMARY KEY AUTO_INCREMENT,
  word VARCHAR(64) NOT NULL,    #单词
  phonetic VARCHAR(64),         #音标
  means_n VARCHAR(128),         #中文翻译 名词
  means_v VARCHAR(128),         #中文翻译 动词
  means_adj VARCHAR(128),       #中文翻译 形容词
  means_adv VARCHAR(128),       #中文翻译 副词
  means_prep VARCHAR(128),      #中文翻译 介词
  example VARCHAR(256),         #例句
  example_means VARCHAR(256)    #句子翻译
);

/**课程**/
CREATE TABLE course(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(256),         #课程标题
  price VARCHAR(16),          #价格
  video VARCHAR(128),         #视频路径
  c_img VARCHAR(128),         #图片路径
  c_type INT                  #视频类型 1：考试 2：阅读 3：听力口语 4：Python编程
);

/**我的词库**/
CREATE TABLE thesaurus(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  word VARCHAR(64) NOT NULL,    #单词
  phonetic VARCHAR(64),         #音标
  means_n VARCHAR(128),         #中文翻译 名词
  means_v VARCHAR(128),         #中文翻译 动词
  means_adj VARCHAR(128),       #中文翻译 形容词
  means_adv VARCHAR(128),       #中文翻译 副词
  means_prep VARCHAR(128),      #中文翻译 介词
  user_uid INT                  #用户id
);

/**大家都在看**/
CREATE TABLE news(
  n_id INT PRIMARY KEY AUTO_INCREMENT,
  n_title VARCHAR(256),   #标题
  n_subtitle VARCHAR(256),#小标题
  n_content VARCHAR(512), #内容 
  n_pic VARCHAR(128)      #图片路径
);

/**扩展包**/
CREATE TABLE expansion(
  eid INT PRIMARY KEY AUTO_INCREMENT,
  e_title VARCHAR(256),       #标题
  e_content VARCHAR(512),     #内容
  e_pic VARCHAR(128),         #图片路径
  e_content_pic VARCHAR(128)  #内容图片路径
);

/**轮播图**/
CREATE TABLE carousel(
  id INT PRIMARY KEY AUTO_INCREMENT,
  picture VARCHAR(128)      #轮播图路径
);


/*******************/
/******数据导入******/
/*******************/
/**用户信息**/
INSERT INTO w_user VALUES
(1,'tom','123456','123456789@163.com','15112345678','img/01.jpg',1,'学霸we are family',NULL,0),
(2,'jerry','abcdef','1211605124@163.com','15125729524','img/02.jpg',2,'学霸we are family',NULL,0),
(3,'join','456123','456466789@163.com','15135412598','img/03.jpg',1,'学霸we are family',NULL,0),
(4,'lily','987654','464286348@163.com','15927535215','img/04.jpg',1,'学霸we are family',NULL,0);

/**单词信息**/
INSERT INTO w_words VALUES
(1,'abandon',"/əˈbændən/",'n.放任，放纵；完全屈从于压制','v.放弃，抛弃；离弃，丢弃；使屈从；停止进行，终止',NULL,NULL,NULL,"The officers and crew prepared to abandon ship in an orderly fashion.",'全体船员秩序井然地准备弃船。'),
(2,'ability',"/əˈbɪləti/",'n.能力，资格；能耐，才能',NULL,NULL,NULL,NULL,"Few would argue that this team has experience and proven ability.",'这个队伍的丰富经验和表现出来的实力是众所公认的。'),
(3,'able',"/able/",NULL,NULL,'adj.能够的；有能力的；有才干的；干练的',NULL,NULL,"Chantal was lucky to be able to salvage her career.",'尚塔尔能保住她的事业算是走了运。'),
(4,'abnormal',"/æbˈnɔ:ml/",NULL,NULL,'adj.反常的，异常的；不规则的；变态的，畸形的；邪门儿',NULL,NULL,"The abnormal bleeding is your body's own red flag of danger.",'非正常的出血是你的身体发出的危险信号。'),
(5,'aboard',"/əˈbɔ:d/",NULL,NULL,NULL,'adv.在船（或飞机、车）上，上船（或飞机、车）；靠船边；在船上；在火车上','prep.在（船、飞机、车）上，上（船、飞机、车）；上车',"She invited 750 people aboard the luxury yacht, the Savarona.",'她邀请了750人乘坐豪华游艇“萨瓦罗纳”号。'),
(6,'about',"/əˈbaʊt/",NULL,NULL,'adj.在附近的；四处走动的；在起作用的；在流行中的','adv.大约；在附近；在四周；几乎','prep.关于；大约；在…周围',"Instead of complaining about what's wrong, be grateful for what's right.",'别抱怨不好的事，要对好的事心存感恩。'),
(7,'above',"/əˈbʌv/",'n.上述',NULL,'adj.上述的','adv.在上面；以上；上述','prep.表示程度）超过；（表示等级）在…之上；（表示位置）在…正上方；（表示比较）优于',"That big high-rise above us is where Brian lives.",'我们上面的那座摩天大楼就是布赖恩住的地方。'),
(8,'abroad',"/əˈbrɔ:d/",'n.海外，异国',NULL,'adj.往国外的','adv.到国外，在海外；广为流传地',NULL,"He rented out his house while he worked abroad.",'他在国外工作期间把自己的房子租了出去。'),
(9,'absence',"/ˈæbsəns/",'n.缺席，缺勤；缺乏，缺少，无；心不在焉，不注意',NULL,NULL,NULL,NULL,"There has been much gossip about the possible reasons for his absence.",'关于他缺席的原因有很多传言。'),
(10,'absolute',"/ˈæbsəlu:t/",'n.绝对；绝对事物',NULL,'adj.绝对的，完全的；不受任何限制[约束]的；无条件的；有无上权力或权威的',NULL,NULL,"I think he's an absolute stinker to do that to her.",'我认为他那样对待她真太缺德了。'),
(11,'absorb',"/əbˈsɔ:b/",NULL,'v.吸收（液体、气体等）；吸引（注意）；吞并，合并；忍受，承担（费用）',NULL,NULL,NULL,"The material can absorb outward-going radiation from the Earth.",'该物质可以吸收地球向外辐射的能量。'),
(12,'abstract',"/ˈæbstrækt/",'n.抽象概念；抽象派艺术作品；摘要；[化]萃取物','v.提取，分离；转移（注意等）；概括，摘录；剽窃','adj.抽象的，理论上的；难解的；抽象派的；茫然的',NULL,NULL,"His painting went through both representational and abstract periods.",'他的绘画经历了具象风格和抽象风格两个阶段。'),
(13,'abundant',"/əˈbʌndənt/",NULL,NULL,'adj.大量的，充足的；丰富的，富有的；丰足；阜',NULL,NULL,"Birds are abundant in the tall vegetation.",'高大的植被中有着大量的鸟类。'),
(14,'abuse',"/əˈbju:s/",'n.滥用；恶习；侮辱；恶言','v.滥用；虐待；辱骂',NULL,NULL,NULL,"West was wilfully blind to the abuse that took place.",'韦斯特对发生的虐待行为故意视而不见。'),
(15,'academic',"/ˌækəˈdemɪk/",'n.学者；大学教师，大学生',NULL,'adj.学院的，大学的，学会的',NULL,NULL,"Henry generally stayed ahead of the others in the academic subjects.",'亨利的文化课成绩通常都优于其他学生。'),
(16,'academy',"/əˈkædəmi/",'n.专科学校；学会，学院；一般的高等教育；私立学校，学术团体',NULL,NULL,NULL,NULL,"By 1936 she was exhibiting at the Royal Academy .",'到1936年她已在皇家艺术学院展出作品。'),
(17,'accelerate',"/əkˈseləreɪt/",NULL,'v.加快，增速；加速，催促；促进；速度增加',NULL,NULL,NULL,"We need to accelerate the pace of change in our backward country.",'我们应当为落后的祖国加快变革的脚步。'),
(18,'acceleration',"/əkˌseləˈreɪʃn/",'n.加速；加速度；加速升级；（优秀学生的）跳级',NULL,NULL,NULL,NULL,"Acceleration is accompanied by a resonating growl from the gearbox.",'变速箱随着加速传来一阵轰鸣。'),
(19,'accent',"/ˈæksent/",'n.重音；口音；腔调','v.重读；标注重音；集中注意力',NULL,NULL,NULL,"There is often a strong accent on material success.",'经常大力强调物质成就。'),
(20,'accept',"/əkˈsept/",NULL,'v.承认；同意；承兑',NULL,NULL,NULL,"He would have to accept it, there was no other way.",'对此他将别无选择，只有接受。'),
(21,'acceptable',"/əkˈseptəbl/",NULL,NULL,'adj.可接受的；合意的',NULL,NULL,"A 10 to 15 percent deviation is considered acceptable .",'10%至15%的离差是可以接受的。'),
(22,'acceptance',"/əkˈseptəns/",'n.接受，接纳；[金融]承兑；无怨接受（逆境、困境等）；赞成',NULL,NULL,NULL,NULL,"Acceptance of women preachers varies greatly from denomination to denomination.",'在接受女性传教士的问题上，不同教派的态度大相径庭。'),
(23,'accidental',"/ˌæksɪˈdentl/",'n.偶然；次要方面',NULL,'adj.意外的，偶然（发生）的；附属的',NULL,NULL,"The jury returned a verdict of accidental death.",'陪审团作出意外死亡的正式裁决。'),
(24,'accommodate',"/əˈkɒmədeɪt/",NULL,'v.容纳；使适应；向…提供住处；帮忙',NULL,NULL,NULL,"He has never put an arm around his wife to accommodate photographers.",'他从未为了迎合摄影师而搂住妻子。'),
(25,'accommodation',"/əˌkɒməˈdeɪʃn/",'n.住处；适应；便利；和解',NULL,NULL,NULL,NULL," His instinct would be to seek a new accommodation with the nationalists.",'他本能的反应会是寻求与民族主义者取得新的和解。'),
(26,'accompany',"/əˈkʌmpəni/",NULL,'v.陪伴，陪同；附加，补充',NULL,NULL,NULL,"Barron invited her to accompany him to the races.",'巴伦邀请她陪他参加比赛。'),
(27,'accomplish',"/əˈkʌmplɪʃ/",NULL,'v.完成；达到（目的）；走完（路程、距离等）',NULL,NULL,NULL,"He is a man who will spoil rather than accomplish things.",'他这个人成事不足,坏事有余.'),
(28,'accord',"/əˈkɔ:d/",'n.协议；条约；（色彩的）协调；和解协议','v.给予；使和谐一致；使符合',NULL,NULL,NULL,"He did not quit as France's prime minister of his own accord .",'他辞去法国总理职务并非出于自愿。'),
(29,'accordance',"/əˈkɔ:dns/",'n.一致；和谐；给予',NULL,NULL,NULL,NULL,"One's opinion tends to differ in accordance with one's standpoint.",'不同的立场势必形成不同的见解.'),
(30,'accordingly',"/əˈkɔ:dɪŋli/",NULL,NULL,NULL,'adv.因此，于是；依据；照着，相应地',NULL,"We have to discover his plans and act accordingly .",'我们得找出他的计划，照着办。'),
(NULL,'account',"/əˈkaʊnt/",'n.账，账目；存款；记述，报告；理由','v.认为；把…视作',NULL,NULL,NULL,"He figured up the balance in their checking account .",'他算出了他们活期存款账户上的余额总和。'),
(NULL,'accumulate',"/əˈkju:mjəleɪt/",NULL,'v.堆积，积累',NULL,NULL,NULL,"How can I accumulate enough cash to get out of debt?",'我怎么才能攒足钱还清债务呢？'),
(NULL,'accuracy',"/ˈækjərəsi/",'n.精确（性），准确（性）',NULL,NULL,NULL,NULL,"He cannot vouch for the accuracy of the story.",'他不能证明这一说法的准确性。'),
(NULL,'accurate',"/ˈækjərət/",NULL,NULL,'adj.精确的，准确的；正确无误的',NULL,NULL,"Broadcast news was accurate and reliable but deadly dull.",'新闻广播准确可靠但却非常枯燥。'),
(NULL,'accuse',"/əˈkju:z/",NULL,'v.指责，谴责；指控',NULL,NULL,NULL,"I hate it when people accuse us of that.",'我讨厌别人就那件事指责我们。'),
(NULL,'accustom',"/əˈkʌstəm/",NULL,'v.使习惯',NULL,NULL,NULL,"It took him a while to accustom himself to the idea.",'他过了一段时间才习惯这个想法.'),
(NULL,'accustomed',"/əˈkʌstəmd/",NULL,'v.使习惯于','adj.习惯的；通常的；独有的；适应的',NULL,NULL,"Bradley is still accustomed to travelling everywhere in style.",'布拉德利仍然保持着每次出行必派头十足的习惯。'),
(NULL,'ache',"/eɪk/",'n.疼痛','v.疼痛；渴望',NULL,NULL,NULL,"If I get another tummy ache, I will wire you to come.",'如果我再肚子疼,我会发电报让你来.'),
(NULL,'achieve',"/əˈtʃi:v/",NULL,'v.取得；获得；实现；成功',NULL,NULL,NULL,"Car firms are desperate to achieve economies of scale.",'汽车厂商拼命想要实现规模经济。'),
(NULL,'achievement',"/əˈtʃi:vmənt/",'n.完成，达到；成就，成绩',NULL,NULL,NULL,NULL,"Only the achievement of these goals will bring lasting peace.",'只有达成这些目标才会带来持久的和平。'),
(NULL,'acid',"/ˈæsɪd/",'n.酸；酸味物质',NULL,'adj.酸味的；尖刻的；酸的；酸性的',NULL,NULL,"Nor is acid rain always, and universally, a bad thing.",'酸雨也并非在任何情况下都是坏事。'),
(NULL,'adapt',"/əˈdæpt/",NULL,'v.适应于，适应不同情况',NULL,NULL,NULL,"Buddhism had to adapt to the new world or perish.",'佛教必须适应新时代，否则将会消亡。'),
(NULL,'add',"/æd/",NULL,'v.增加；补充；附带说明；',NULL,NULL,NULL,"His comments are bound to add fuel to the debate.",'他的话必将为争论推波助澜。'),
(NULL,'addition',"/əˈdɪʃn/",'n.加，增加，附加；',NULL,NULL,NULL,NULL,"In addition to my weekly wage, I got a lot of tips.",'除了每周的薪水外，我还能得到不少小费。'),
(NULL,'address',"/əˈdres/",'n.地址；通信处；演说；称呼','v.写姓名地址；演说；向…说话；称呼',NULL,NULL,NULL,"I looked your address up in the personnel file.",'我在人事档案里找到了你的地址。'),
(NULL,'adequate',"/ˈædɪkwət/",NULL,NULL,'adj.足够的；适当的，恰当的；差强人意的；胜任的',NULL,NULL," Most states guarantee the right to free and adequate education.",'大多数州都保障人们免费享受充分教育的权利。'),
(NULL,'adjective',"/ˈædʒɪktɪv/",'n.形容词',NULL,'adj.形容词的；附属的，不独立的；[法]有关程序的',NULL,NULL," 'My'is a possessive adjective .",'my 是个所有格形容词.'),
(NULL,'adjust',"/əˈdʒʌst/",NULL,'v.改变…以）适应，调整，校正；调准（望远镜等）',NULL,NULL,NULL,"Adjust the lighting so it is soft and restful.",'调节灯光使其看上去既柔和又能给人带来舒缓感。'),
(NULL,'administration',"/ədˌmɪnɪˈstreɪʃn/",'n.管理；实行；（政府）行政机关',NULL,NULL,NULL,NULL,"The administration is in the process of drawing up a peace plan.",'政府正在起草和平计划。'),
(NULL,'admire',"/ədˈmaɪə(r)/",NULL,'v.赞赏；称赞；欣赏；想要',NULL,NULL,NULL,"We admire her dedication to the cause of humanity.",'我们敬佩她对人类事业的献身精神。'),
(NULL,'admission',"/ədˈmɪʃn/",'n.准许进入；承认；坦白；入场费',NULL,NULL,NULL,NULL,"She wanted some admission of guilt from her father.",'她期待她父亲能够认罪。'),
(NULL,'admit',"/ədˈmɪt/",NULL,'v.许可进入；承认，供认',NULL,NULL,NULL," You have to admit that you are, in fact, in difficulties.",'你不得不承认，你事实上是陷入了困境。'),
(NULL,'adopt',"/əˈdɒpt/",NULL,'v.采用，采取，采纳；收养；正式接受，接受；批准',NULL,NULL,NULL,"Britain is to adopt a more re-strictive policy on arms sales.",'英国将对武器出售采取更具限制性的政策。'),
(NULL,'adult',"/ˈædʌlt/",'n.成年的人或动物',NULL,'adj.成熟的；（智力、思想、行为）成熟的；成年人的；成年的',NULL,NULL," I tried to understand the adult world and could not.",'我试着去了解成人世界，却无法猜透。'),
(NULL,'advance',"/ədˈvɑ:ns/",'n.增长；借款；（价格、价值的）上涨；预付款','v.前进；将…提前；预付；提出','adj.预先的；先行的',NULL,NULL,"It is a good idea to place your order well in advance .",'早早就提前下单是个好主意。'),
(NULL,'advanced',"/ədˈvænst/",NULL,'v.前进','adj.先进的；高等的，高深的；年老的；晚期的',NULL,NULL," The way Swedes integrate immigrants is, she feels, 100% more advanced .",'她觉得瑞典人帮助移民适应当地生活的方式百分百地更为先进。'),
(NULL,'advantage',"/ədˈvɑ:ntɪdʒ/",'n.有利条件；益处；','v.有利于；有益于',NULL,NULL,NULL,"I want to take advantage of your lifetime of scholarship.",'我希望能够用到您一生的学识。'),
(NULL,'adventure',"/ədˈventʃə(r)/",'n.冒险活动；冒险经历；奇遇',NULL,NULL,NULL,NULL,"He has adventure in his blood.",'他天生具备冒险基因。'),
(NULL,'advisable',"/ədˈvaɪzəbl/",NULL,NULL,'adj.明智的；可取的；能劝告的；适当的',NULL,NULL,"Early booking is advisable .",'早订票是明智的。'),
(NULL,'affair',"/əˈfeə(r)/",'n.事情，事件；事务；个人的事，私事；风流韵事',NULL,NULL,NULL,NULL,"He claims he was made the fall guy for the affair .",'他声称自己是这起事件的替罪羊。');

/**课程 1：考试 2：阅读 3：听力口语 4：Python编程**/
INSERT INTO course VALUES
(1,'365特权计划|坚持+奖励，高效学英语！','免费','12.jpg','5.jpg',2),
(2,'读书计划|哈利·波特重新上线！','免费','13.jpg','6.jpg',2),
(3,'初学者必看，60天书刷完15部美剧！','免费','14.jpg','7.jpg',3),
(4,'|逆袭听力，就在暑假！','免费','15.jpg','8.jpg',1),
(5,'Python编程暑期班|坚持打卡返50%学费！','免费','14.jpg','8.jpg',4),
(6,'考研长难句|每天10分钟，攻克长难句！','免费','14.png','9.jpg',1),
(7,'四六级准考证助手|意见登记，出分及时推成绩','免费','15.jpg','5.jpg',1),
(8,'四级循环单词炼句书|考试必备套装','免费','15.png','6.jpg',1),
(9,'单词的力量|词根记忆法背单词','免费','18.jpg','7.jpg',1),
(10,'六级循环单词书|核心单词循环记','免费','17.png','8.jpg',1),
(11,'智慧词根扩展包|精选词根，科学高效背单词','免费','19.jpg','9.jpg',1),
(12,'实体书|经典写作指南|介绍写作方法','免费','18.png','5.jpg',1),
(13,'麦林韦氏图解词典|主体讲解，百科全书','免费','12.jpg','6.jpg',1),
(14,'柯林斯词典扩展包|权威词典 用英文学英文','免费','19.png','7.jpg',1),
(15,'六级语境助记单词书|带入语境记单词','免费','13.jpg','8.jpg',1),
(16,'派生联想扩展包','免费','12.png','9.jpg',1),
(17,'小王子|长大后的必读童话','免费','14.jpg','9.jpg',2),
(18,'月亮与六便士|江头梦想与现实','免费','13.png','8.jpg',2),
(19,'了不起的盖茨比|华丽的爱情悲剧','免费','15.jpg','7.jpg',2),
(20,'芒果街上的小屋|关于成长的诗集','免费','14.png','6.jpg',2),
(21,'老人与海|激励心灵的勇气之书','免费','17.jpg','5.jpg',2),
(22,'绿野仙踪|关于爱、勇气、梦想','免费','15.png','9.jpg',2),
(23,'假如给我三天光明|寄生活以希望','免费','18.jpg','8.jpg',2),
(24,'因为爱情','免费','17.png','7.jpg',2),
(25,'哈利波特|全方位深入魔法世界','免费','19.jpg','6.jpg',2),
(26,'哈利波特1-7册|魔法世界全面开启','免费','18.png','5.jpg',2),
(27,'汉语世界|地道英文讲述中国故事','免费','12.jpg','9.jpg',2),
(28,'城市风光 精品英语旅游读物','免费','19.png','8.jpg',2),
(29,'纳尼亚传奇|奇幻文学经典','免费','12.jpg','7.jpg',2),
(30,'米歇尔自传|战胜挫折成为自己','免费','12.png','6.jpg',2),
(31,'留声英语|每天15分钟，轻松听懂英语原声视频','免费','19.jpg','7.jpg',3),
(32,'逆袭听力，就在暑假','免费','19.png','8.jpg',3),
(33,'暑假出发，60天带你环游世界','免费','18.jpg','9.jpg',3),
(34,'基础美音特训|每天15分钟，4周练就纯正美音','免费','18.png','6.jpg',3),
(35,'听歌学英语|先给同时爱着音乐和英语的你','免费','17.png','5.jpg',3),
(36,'商业英语|从过去到未来，商业如何改变世界','免费','15.jpg','7.jpg',3),
(37,'电影英语|趁年轻不可不看的60个电影片段','免费','14.jpg','8.jpg',3);

/**我的词库**/

/**大家都在看**/
INSERT INTO news VALUES
(NULL,'【你问我答】之动物相关英语表达','▼“cat is meow”（猫喵喵叫）还有什么别的意思吗？','☞英语里的“cat is meow”还有“比别人都强；是最棒的”的意思哦。猫叫声到底棒在那儿了呢？关于这个表达的起源没有明确的定论。有人猜测，这或许与20世纪90年代的美国将猫作为一种备受追捧的文化符号有关。巧的是，在我们中文里，猫叫声“喵”恰好是“妙”的谐音。所以看到“cat is meow”时，可以直接想“妙妙妙（喵喵喵）”，是不是一下就好记了呢？造个句：“His new car is the cat is meow.”（他的新车真是棒得不得了。）','1.jpg'),
(NULL,'地道表达法','地道表达法','eye除了作名词，表示“眼睛”之外，还可以作动词使用，表示“注视，看”的意思。那你知道eye someone up是什么意思吗？这个短语一般用来表示“色迷迷地看，向……送秋波”：She caught a young man eyeing her up in the corner.她发现角落里有个年轻人在色迷迷地打量她。','2.jpg'),
(NULL,'【你问我答】之与成语相关的表达','▼你知道“置若罔闻”用英语怎么说吗？','我们可以用“fall on deaf ears”来表达“（建议或警告等）未被理睬，被置若罔闻”的意思喔。这个表达的字面意思是“落在了听不见的耳中”，可不就是“被置若罔闻”嘛。小编给大家造个句：“I told him to be careful but my words seemed to fall on deaf ears.（我告诉过他要小心，但是他似乎把我的话当耳旁风，置之不理。）”','3.gif'),
(NULL,'【你问我答】之食物相关英语表达','你知道“十拿九稳”用英语怎么说吗？','可以用上一个跟食物有关的表达：“dollars to doughnuts”。美元（dollar）和美味的甜甜圈（doughnut）凑到一起，怎么就成了“十拿九稳”的意思呢？原因在于，以前美元的价值很高，光一美元也可以买到很多东西。而那时候的甜甜圈也很便宜，要是拿几美元的价值跟区区几个面包圈的价值相比，美元的优势当然不在话下，于是人们开始用“dollars to doughnuts”来表示“十拿九稳”的意思了。来看个句子巩固一下吧：“I will bet you it is dollars to doughnuts that the Los Angeles Lakers will win the title again.”（我敢跟你打赌，洛杉矶湖人百分之百会再次夺冠。）','4.gif'),
(NULL,'【你问我答】之身体部位相关英语表达','如何形容一个人爱吃甜食呢？','马卡龙、提拉米苏、焦糖布丁、奶油泡芙、酒心巧克力......数不胜数的甜食，对于爱吃甜食的吃货们来说，怎么可以辜负呢？而英语中形容人爱吃甜食就可以这样说：“have a sweet tooth”， 想想也是，吃甜食吃到牙齿都变甜了，能不爱甜食嘛（不过这到底是有多爱呀～）。比如，她可爱吃甜食了，一见到甜品就激动，就可以这样说：“She has a sweet tooth and always gets excited about desserts.”。不过甜品好吃，莫要贪嘴喔～','5.gif'),
(NULL,'【你问我答】之英语表达背后的西方文化','“很古老”为什么是“old as the hills”呢？','“old as the hills”，难道是说某样东西或人“老得像山一样”吗？其实，这则短语的意思就是“非常老，很古老”。其起源出自于《圣经·约伯记》第15章第7节“ 你岂是头一个被生的人吗？你受造在诸山之先吗？（Were you the first man to be born? Or were you brought forth before the hills?）”中国人也有“寿比南山”的说法。把一个人的年龄和山丘的岁数相提并论，可知那确实是非常年迈了。假如我们想描述一样东西陈旧不已，也可以用上“old as the hills”这个表达哦，比如“This dress is as old as the hills.”（这条裙子可算是老古董了。）','6.gif'),
(NULL,'【你问我答】之与颜色相关的表达','你知道“out of the blue”是什么意思吗？','“out of the blue”表示“出人意料地；晴天霹雳一般”。举个栗子，“昨天，他突然打电话给我，说他心情不太好”就可以说“He phoned me out of the blue yesterday and said he was feeling blue.” 这里的“feel blue”表示“心情不好；郁郁不乐”。','7.gif'),
(NULL,'【你问我答】之俗语表达','“有钱能使鬼推磨”用英语怎么说呢？','金钱会赋予人权力和影响力，促进事情顺利发展。也就是我们常说的：“财大气就粗；有钱就有势”，而英语中相应的说法可以用“money talks”来表示。这个表达从字面来理解意思是”金钱说话”，也就是金钱有发言权的意思，延伸一下就是“有钱能使鬼推磨”，换一种高雅的说法：“金钱是万能的”。举个栗子：“Of course he will get what he wants. Money talks, doesn is it?（他当然是想要什么就有什么啦，有钱能使鬼推磨，难道不是吗？）”','8.gif'),
(NULL,'【你问我答】之不同的人有不同的特征','该怎么形容那些“外粗内秀的人”呢？','英语中的“a rough diamond”可以用来形容“外粗内秀的人”。“rough”是“粗糙的”意思，“粗糙的钻石”，未经打磨，未经加工，可用于形容那些看上去粗鲁但心地善良品质高尚的人。比如，如果你有朋友平时不修边幅不拘小节，但人真的超棒的，就可以说“He is intelligent and honest but lacks manners. He is a rough diamond.”就是“他聪明诚实，但不太注意礼貌，是个外粗内秀的人”。','9.jpg'),
(NULL,'【你问我答】之单词字母小知识','“cuffing season”是指哪个季节呢？','“cuffing season”指的是秋冬两季。“cuffing”来自于动词“cuff”，表示“给……带上手铐”。秋天和冬天天气严寒，人们在寒冷的天气里通常喜欢和男/女朋友抱团取暖，单身狗也会希望有一段认真的恋情把自己“铐起来”。所以“cuffing season”在柯林斯词典中的解释就是“想要找固定伴侣的（秋冬）季节”。造个句：“I wish to have a girlfriend to spend the cuffing season together.（我希望能有一个一起度过秋冬季节的女朋友。）”所以你想和谁一起度过这个cuffing season呢？','10.jpg');

/**扩展包**/
INSERT INTO expansion VALUES
(NULL,'柯林斯词典','权威的英文词典，用英文学习英文','cidian.png','expansion01.png'),
(NULL,'智慧词根','词根体现单词的本质含义，学习单词更轻松','zhihui.png','expansion02.png'),
(NULL,'派生联想','通过构词法和语义联想，把单词串成树','lianxiang.png','expansion03.png');

/**轮播图**/
INSERT INTO carousel VALUES
(NULL,'carousel1.jpg'),
(NULL,'carousel2.jpg'),
(NULL,'carousel3.jpg'),
(NULL,'carousel4.jpg'),
(NULL,'carousel5.jpg');