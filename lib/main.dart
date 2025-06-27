import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/mvvm/views/snh_member_list_page.dart';
import 'package:study_flutter/page/constraints_demo_page.dart';
import 'package:study_flutter/page/context_demo_page.dart';
import 'package:study_flutter/page/custom_scroll_page.dart';
import 'package:study_flutter/home_list_page.dart';
import 'package:study_flutter/page/keep_alive_demo_page.dart';
import 'package:study_flutter/page/keep_offset_demo_page.dart';
import 'package:study_flutter/page/lifecycle_test_page.dart';
import 'package:study_flutter/page/scrollcontroller_demo_page.dart';
import 'package:study_flutter/page/stateless_page.dart';
import 'package:study_flutter/page/tablet_test_page.dart';
import 'package:study_flutter/routes/app_pages.dart';
import 'package:study_flutter/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppRoutes.root, getPages: AppPages.routes);
  }
}
