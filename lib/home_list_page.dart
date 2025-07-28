import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/routes/app_routes.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  // 使用 AppRoutes 常量替代字符串
  final List<Map<String, dynamic>> pages = [
    // {'title': '状态Demo', 'route': AppRoutes.stateless},
    // {'title': 'ContextDemoPage', 'route': AppRoutes.contextDemo},
    // {'title': '生命周期Demo', 'route': AppRoutes.lifecycle},
    // {'title': '盒子约束Demo', 'route': AppRoutes.constraints},
    // // 这个路由 '/more' 没有定义常量，如果需要可以自己添加
    // {'title': '多组件装填Demo', 'route': '/more'},
    // {'title': '滑动控制器Demo', 'route': AppRoutes.scrollController},
    // {'title': '监听滑动Demo', 'route': AppRoutes.keepOffset},
    // {'title': '适配Pda Demo', 'route': AppRoutes.tablet},
    // {'title': '列表缓存Demo', 'route': AppRoutes.keepAlive},
    // {'title': '综合滑动控件Demo', 'route': AppRoutes.customScroll},
    {'title': 'SNH48 成员列表', 'route': AppRoutes.demoSnh},
    {'title': 'element 生命周期理解', 'route': AppRoutes.element},
    {'title': 'frame 理解', 'route': AppRoutes.frame},
    {'title': 'layout 理解', 'route': AppRoutes.layout},
  ];

  String md =
  "# 哈哈哈哈哈的多元世界 \n## “哈哈哈” 含义解读 \n### 日常情感表达 \n#### 开心喜悦之情 \n##### “哈哈哈” 常用来表达开心喜悦，当人们碰到令人开心的事情，像表白成功、成功通过考试、获得奖项等，就会用它来抒发内心的喜悦。这种表达简单直接，能让他人迅速感受到其欢快的情绪，是一种积极情绪的自然流露。\n#### 尴尬局面掩饰 \n##### 在遇到一些比较尴尬的场景或局面时，比如说错话、出洋相，人们也会使用 “哈哈哈” 来表达尴尬之情。它能在一定程度上缓解尴尬的氛围，避免场面过于冷场，是一种巧妙化解尴尬的方式。\n### 聊天回复含义 \n#### 觉得话题有趣 \n##### 当和对方聊天时，若话题刚好戳中对方笑点，对方为表达被话语感染，就会发 “哈哈哈”。时间久了，对方可能会逐渐对聊天者也产生兴趣，这是一种积极的聊天反馈，能促进交流的进一步深入。\n#### 表示无语敷衍 \n##### 若对方觉得很无语，又不知说什么，就会用 “哈哈哈” 掩饰尴尬或直接表达尴尬。也有可能对方正忙，为不中断聊天，就用简单语气回复，这体现了 “哈哈哈” 在聊天中的灵活运用。\n## “哈哈” 的词性用法 \n### 不同词性应用 \n#### 作为动词使用 \n##### “哈哈” 作动词可用于 “打哈哈”，意思是开玩笑或者凑趣。在日常交流中，人们常说 “别光打哈哈了，说点正经的”，体现了其在口语表达中的常见用法。\n#### 作为名词使用 \n##### “哈哈” 作名词可用于 “哈哈儿”，指可笑的事。例如 “这事儿可真是个哈哈儿”，形象地表达出事情的可笑程度。\n### 笑声拟声表意 \n#### 拟声体现笑声 \n##### “哈哈” 是笑声的拟声词，生动地模拟了人们开怀大笑的声音。当描述某人开心大笑时，用 “哈哈” 能让读者更直观地感受到其欢快的状态。\n#### 表达得意满意 \n##### “哈哈” 还可表示得意或满意。比如某人完成一项困难任务后，可能会 “哈哈” 一笑，展现出内心的得意和满足。\n## 《哈哈哈哈哈》节目趣事 \n### 主题曲发布会 \n#### 主题阐述环节 \n##### 《哈哈哈哈哈》第三季主题曲发布会一开始，主持人让五哈团阐述主题曲主题，鹿晗被迫接过话筒，用 “废话文学” 阐述，展现出节目中成员们的有趣互动和轻松氛围。\n#### 媒体提问挑战 \n##### 发布会现场媒体向五哈团提问，抛出各种难题。王勉称把《咏鹅》融入歌曲，邓超现场表演英文 rap，经典发言点燃现场气氛，体现了节目充满意外和笑点的特点。\n### 创作凝聚力量 \n#### 极限创作过程 \n##### 发布会后五哈团进入极限 48 小时主题曲创作日，陈赫、范志毅、王勉展露出 “飘忽不定” 的音乐才华，导师梁龙、马頔开启躺平模式，创作过程困难重重。\n#### 体会团队重要 \n##### 通过这次创作，五哈团体会到团体力量的强大和团魂的重要性。创作虽有困难，但伙伴间相互支持，体现了节目不仅有娱乐性，还注重团队精神的传递。\n## 游戏相关内容 \n### 《勇敢的哈克》\n#### 操作逃课方法 \n##### 《勇敢的哈克》手游有独特操作方法，如满跳 + 上劈 + 冲刺可增加跳跃高度，用冲刺找台阶沿；还有全方位冲刺逃课方法，用冲刺斩进入隐藏铁墙，下劈获取物品。\n#### 游戏价值评估 \n##### 该游戏是 28 元买断制，操作手感不错，无断触，自由度高，有很多隐藏可探索地方。地图类似恶魔城，解谜探索占比多，boss 战有难度，适合喜欢 “类银河城” 的玩家。\n### 《泰拉瑞亚》\n#### 游戏基本介绍 \n##### 《泰拉瑞亚》是沙盒像素类游戏，玩家在游戏内生存发育并击败 boss 解放泰拉大陆。每个 boss 难度大，考验操作，打击感强，击败 boss 有成就感。\n#### 探索建筑乐趣 \n#####"
  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由列表'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var item = pages[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(item['route']);
                },
                child: Text(item['title'])),
          );
        },
        itemCount: pages.length,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        List<PptOutlineItem> list =  parsePptOutlineItems(md);
        printOutlineItems(list);
      },),
    );
  }
}

List<PptOutlineItem> parsePptOutlineItems(String? markdown) {
  final outlines = <PptOutlineItem>[];
  if (markdown == null || markdown.trim().isEmpty) return outlines;


  final lines = markdown.split('\n');

  PptOutlineItemContent? currentContent; // 用于存放当前四级内容，方便放子内容
  PptOutlineItemContentItem? currentContentItem; // 如果需要也可以用来放更深层级子内容，这里暂时不做多层嵌套

  for (final line in lines) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) continue;

    final match = RegExp(r'^(#{1,5})\s+(.*)').firstMatch(trimmed);
    if (match == null) continue;

    final level = match.group(1)!.length;
    final content = match.group(2)!;

    switch (level) {
      case 1:
        outlines.add(PptOutlineItemStart(outlines.length + 1, content));
        currentContent = null;
        currentContentItem = null;
        break;
      case 2:
        outlines.add(PptOutlineItemMenu(outlines.length + 1, [content]));
        currentContent = null;
        currentContentItem = null;
        break;
      case 3:
        outlines.add(PptOutlineItemChapter(outlines.length + 1, content, content));
        currentContent = null;
        currentContentItem = null;
        break;
      case 4:
        final newContent = PptOutlineItemContent(outlines.length + 1, content);
        outlines.add(newContent);
        currentContent = newContent;
        currentContentItem = null;
        break;
      case 5:
        if (currentContent != null) {
          final newSubItem = PptOutlineItemContentItem(content, '', outlines.length + 1);
          currentContent.subContentList.add(newSubItem);
          currentContentItem = newSubItem;
        }
        break;
      default:
      // 超出5级的标题暂时忽略
        break;
    }
  }

  return outlines;
}


void printOutlineItems(List<PptOutlineItem> items, [int indent = 0]) {
  final indentStr = '  ' * indent;
  for (final item in items) {
    if (item is PptOutlineItemStart) {
      print('${indentStr}# (level 1) Start: page=${item.page}, firstline="${item.firstline}"');
    } else if (item is PptOutlineItemMenu) {
      print('${indentStr}## (level 2) Menu: page=${item.page}, points=${item.pointList}');
    } else if (item is PptOutlineItemChapter) {
      print('${indentStr}### (level 3) Chapter: page=${item.page}, firstline="${item.firstline}", key=${item.key}');
    } else if (item is PptOutlineItemContent) {
      print('${indentStr}#### (level 4) Content: page=${item.page}, firstline="${item.firstline}"');
      for (final sub in item.subContentList) {
        printContentItem(sub, indent + 1);
      }
    } else if (item is PptOutlineItemEnd) {
      print('${indentStr}End: firstline="${item.firstline}"');
    }
  }
}

void printContentItem(PptOutlineItemContentItem item, int indent) {
  final indentStr = '  ' * indent;
  final levelNum = 5; // 子内容对应 # 级别固定为 5 级
  print('${indentStr}${'#' * levelNum} (level $levelNum) ContentItem: firstline="${item.firstline}", secondline="${item.secondline}"');
  for (final sub in item.subContentList) {
    printContentItem(sub, indent + 1);
  }
}





sealed class PptOutlineItem {
  // 是否可以展开
  bool isExpandable = false;

  // 是否是展开状态
  bool isExpanded = false;

  PptOutlineItem({this.isExpandable = false, this.isExpanded = false});
}

// 首页
class PptOutlineItemStart extends PptOutlineItem {
  final int page;
  final String firstline;

  PptOutlineItemStart(this.page, this.firstline);
}

// 目录
class PptOutlineItemMenu extends PptOutlineItem {
  final int page;
  List<String> pointList;

  // PptOutlineItemMenu(this.page, List<dynamic> pointObject)
  //     : point = List<String>.from(pointObject);

  PptOutlineItemMenu(this.page, this.pointList,
      {super.isExpandable = false, super.isExpanded = false});
}

// 章节
class PptOutlineItemChapter extends PptOutlineItem {
  final int page;
  final String firstline;
  final String key;

  PptOutlineItemChapter(this.page, this.firstline, this.key);
}

// 内容
class PptOutlineItemContent extends PptOutlineItem {
  final int page;
  final String firstline;
  List<PptOutlineItemContentItem> subContentList = [];

  PptOutlineItemContent(this.page, this.firstline);
}

// 子内容
class PptOutlineItemContentItem {
  final String firstline;
  final String secondline;
  int level = 0; // 子内容的第几层
  List<PptOutlineItemContentItem> subContentList = [];

  // 是否可以展开
  bool isExpandable = false;

  // 是否是展开状态
  bool isExpanded = false;

  PptOutlineItemContentItem(this.firstline, this.secondline, this.level);
}

// 结尾 内容由AI生成，仅供参考
class PptOutlineItemEnd extends PptOutlineItem {
  final String firstline;

  PptOutlineItemEnd(this.firstline);
}
