import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:study_flutter/ui/page/home_list/base_study_page.dart';
import 'package:study_flutter/ui/page/home_list/complex_demo_page.dart';
import 'package:study_flutter/ui/page/home_list/get_x_study_page.dart';
import 'package:study_flutter/ui/page/home_list/scroll_study_page.dart';

import '../home_list_page.dart';
import '../ui/page/home_list/source_study_page.dart';
import 'app_routes.dart';

final List<GetPage> mainRoutes = [
  GetPage(name: AppRoutes.root, page: () => HomeListPage()),
  GetPage(name: AppRoutes.base_study, page: () => BaseStudyPage()),
  GetPage(name: AppRoutes.source_study, page: () => SourceStudyPage()),
  GetPage(name: AppRoutes.scroll_study, page: () => ScrollStudyPage()),
  GetPage(name: AppRoutes.complex_demo, page: () => ComplexDemoPage()),
  GetPage(name: AppRoutes.getx_study, page: () => GetXStudyPage()),
];
