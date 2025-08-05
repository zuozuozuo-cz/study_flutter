import 'package:flutter/cupertino.dart';
import 'package:study_flutter/ui/page/template/simple_route_list_page.dart';

import '../../../routes/app_routes.dart';

class BaseStudyPage extends StatefulWidget {
  const BaseStudyPage({super.key});

  @override
  State<BaseStudyPage> createState() => _BaseStudyPageState();
}

class _BaseStudyPageState extends State<BaseStudyPage> {
  // 使用 AppRoutes 常量替代字符串
  final List<Map<String, String>> pages = [
    {'title': '状态Demo', 'route': AppRoutes.stateless},
    {'title': 'ContextDemoPage', 'route': AppRoutes.contextDemo},
    {'title': '生命周期Demo', 'route': AppRoutes.lifecycle},
    {'title': '盒子约束Demo', 'route': AppRoutes.constraints},
    {'title': '多组件装填Demo', 'route': '/more'},
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleRouteListPage(title: '基本学习页面', routes: pages);
  }
}
