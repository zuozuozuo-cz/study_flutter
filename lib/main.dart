import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/page/constraints_demo_page.dart';
import 'package:study_flutter/page/context_demo_page.dart';
import 'package:study_flutter/page/custom_scroll_page.dart';
import 'package:study_flutter/page/home_list_page.dart';
import 'package:study_flutter/page/keep_alive_demo_page.dart';
import 'package:study_flutter/page/keep_offset_demo_page.dart';
import 'package:study_flutter/page/lifecycle_test_page.dart';
import 'package:study_flutter/page/scrollcontroller_demo_page.dart';
import 'package:study_flutter/page/stateless_page.dart';
import 'package:study_flutter/page/tablet_test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeListPage()),
        GetPage(name: '/stateless', page: () => StatelessPage()),
        GetPage(name: '/context', page: () => ContextDemoPage()),
        GetPage(name: '/life', page: () => LifecycleTestPage()),
        GetPage(name: '/scrollcontroller', page: () => ScrollcontrollerDemoPage()),
        GetPage(name: '/keepoffset', page: ()=>KeepOffsetDemoPage()),
        GetPage(name: '/constraints', page: () => ConstraintsDemoPage()),
        GetPage(name: '/tablet', page: () => TabletTestPage()),
        GetPage(name: '/keepalive', page:()=> KeepAliveDemoPage()),
        GetPage(name: '/customscroll', page: ()=>CustomScrollPage())
        // GetPage(name: 'nested', page: ()=>NestedScrollView(headerSliverBuilder: headerSliverBuilder, body: body))
      ],
    );
  }
}
