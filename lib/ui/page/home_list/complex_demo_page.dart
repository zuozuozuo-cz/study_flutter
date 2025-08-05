import 'package:flutter/cupertino.dart';

import '../../../routes/app_routes.dart';
import '../template/simple_route_list_page.dart';

class ComplexDemoPage extends StatefulWidget {
  const ComplexDemoPage({super.key});

  @override
  State<ComplexDemoPage> createState() => _ComplexDemoPageState();
}

class _ComplexDemoPageState extends State<ComplexDemoPage> {
  final List<Map<String, String>> pages = [
    {'title': '综合滑动控件Demo', 'route': AppRoutes.customScroll},
    {'title': 'SNH48 成员列表', 'route': AppRoutes.demoSnh},
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleRouteListPage(title: '路由列表', routes: pages);
  }
}
