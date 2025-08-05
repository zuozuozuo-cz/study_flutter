import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/routes/app_routes.dart';
import 'package:study_flutter/ui/page/template/simple_route_list_page.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  // 使用 AppRoutes 常量替代字符串
  // final List<Map<String, String>> pages = [
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
    // {'title': 'SNH48 成员列表', 'route': AppRoutes.demoSnh},
    // {'title': 'element 生命周期理解', 'route': AppRoutes.element},
    // {'title': 'frame 理解', 'route': AppRoutes.frame},
    // {'title': 'layout 理解', 'route': AppRoutes.layout},
    // {'title': '绘制 理解', 'route': AppRoutes.painting},
    // {'title': '合成 理解', 'route': AppRoutes.compositing},
  // ];
  final List<Map<String, String>> pages = [
    {'title':'基本学习demo','route' : AppRoutes.base_study},
    {'title':'源码理解demo','route' : AppRoutes.source_study},
    {'title':'滑动控件学习demo','route' : AppRoutes.scroll_study},
    {'title':'综合demo','route' : AppRoutes.complex_demo},
    {'title':'GetX学习demo','route' : AppRoutes.getx_study},
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleRouteListPage(title: '路由列表', routes: pages);
  }
}