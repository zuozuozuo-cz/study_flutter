import 'package:flutter/cupertino.dart';
import 'package:study_flutter/ui/page/template/simple_route_list_page.dart';

import '../../../routes/app_routes.dart';

class SourceStudyPage extends StatefulWidget {
  const SourceStudyPage({super.key});

  @override
  State<SourceStudyPage> createState() => _SourceStudyPageState();
}

class _SourceStudyPageState extends State<SourceStudyPage> {
  // 使用 AppRoutes 常量替代字符串
  final List<Map<String, String>> pages = [
    {'title': 'frame 理解', 'route': AppRoutes.frame},
    {'title': 'layout 理解', 'route': AppRoutes.layout},
    {'title': '绘制 理解', 'route': AppRoutes.painting},
    {'title': '合成 理解', 'route': AppRoutes.compositing},
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleRouteListPage(title: '源码学习页面', routes: pages);
  }
}
