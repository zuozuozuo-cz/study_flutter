import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:study_flutter/page/understanding/element_lifecycle_page.dart';
import 'package:study_flutter/page/understanding/frame_page.dart';
import 'package:study_flutter/page/understanding/layout/layout_page.dart';
import 'package:study_flutter/routes/app_routes.dart';

final List<GetPage> understandingRoutes = [
  GetPage(name: AppRoutes.element, page: () => ElementLifecyclePage()),
  GetPage(name: AppRoutes.frame, page: () => FramePage()),
  GetPage(name: AppRoutes.layout, page: () => LayoutPage()),
];
