import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  final List<Map<String, dynamic>> pages = [
    {'title': 'StatelessWidget', 'route': '/stateless'},
    {'title': 'ContextDemoPage', 'route': '/context'},
    {'title': 'LifeCycleDemoPage', 'route': '/life'},
    {'title': 'ConstraintsDemoPage', 'route': '/constraints'},
    {'title': 'MoreStatefulWidgetPage', 'route': '/more'},
    {'title': 'ScrollcontrollerDemoPage', 'route': '/scrollcontroller'},
    {'title': 'KeepOffsetDemoPage', 'route': '/keepoffset'},
    {'title': 'TabletTestPage', 'route': '/tablet'},
    {'title': 'KeepAliveDemoPage', 'route': '/keepalive'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由列表'),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        var item = pages[index];
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
              onPressed: () {
                Get.toNamed(item['route']);
              },
              child: Text(item['title'])),
        );
      },itemCount: pages.length,),
    );
  }
}
