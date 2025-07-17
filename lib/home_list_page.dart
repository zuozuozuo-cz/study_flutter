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
  ];

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
    );
  }
}
