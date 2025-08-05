import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:study_flutter/routes/app_pages.dart';
import 'package:study_flutter/routes/app_routes.dart';


final logger = Logger();
void main() {
  // MyBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: AppRoutes.root, getPages: AppPages.routes);
  }
}

class MyBinding extends WidgetsFlutterBinding {
  MyBinding() {
    //window.onBeginFrame = _onBeginFrame;
    PlatformDispatcher.instance.onBeginFrame = _onBeginFrame;

    // window.onDrawFrame = _onDrawFrame;
    PlatformDispatcher.instance.onDrawFrame = _onDrawFrame;
  }

  void _onBeginFrame(Duration? timestamp) {
    logger.d('message-frame --------> [onBeginFrame] vsync 信号到达:$timestamp');
    handleBeginFrame(timestamp);
  }

  void _onDrawFrame(){
    logger.d('message-frame --------> [onDrawFrame] 开始执行 drawFrame');
    handleDrawFrame(); // 会调用 build、layout、paint 流程
  }
}
