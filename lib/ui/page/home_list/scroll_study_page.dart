import 'package:flutter/cupertino.dart';

import '../../../routes/app_routes.dart';
import '../template/simple_route_list_page.dart';

class ScrollStudyPage extends StatefulWidget {
  const ScrollStudyPage({super.key});

  @override
  State<ScrollStudyPage> createState() => _ScrollStudyPageState();
}

class _ScrollStudyPageState extends State<ScrollStudyPage> {
  // 使用 AppRoutes 常量替代字符串
  final List<Map<String, String>> pages = [

    {'title': '多组件装填Demo', 'route': '/more'},
    {'title': '滑动控制器Demo', 'route': AppRoutes.scrollController},
    {'title': '监听滑动Demo', 'route': AppRoutes.keepOffset},
    {'title': '适配Pda Demo', 'route': AppRoutes.tablet},
    {'title': '列表缓存Demo', 'route': AppRoutes.keepAlive},
    {'title': '综合滑动控件Demo', 'route': AppRoutes.customScroll},
    {'title': 'SNH48 成员列表', 'route': AppRoutes.demoSnh},
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleRouteListPage(title: '滑动控件学习页面', routes: pages);
  }
}
