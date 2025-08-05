import 'package:flutter/cupertino.dart';

import '../template/simple_route_list_page.dart';

class GetXStudyPage extends StatefulWidget {
  const GetXStudyPage({super.key});

  @override
  State<GetXStudyPage> createState() => _GetXStudyPageState();
}

class _GetXStudyPageState extends State<GetXStudyPage> {
  // 使用 AppRoutes 常量替代字符串
  final List<Map<String, String>> pages = [];

  @override
  Widget build(BuildContext context) {
    return SimpleRouteListPage(title: 'GetX学习页面', routes: pages);
  }
}
