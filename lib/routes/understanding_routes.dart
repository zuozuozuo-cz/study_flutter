import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:study_flutter/routes/app_routes.dart';

import '../ui/page/understanding/compositing/compositing_page.dart';
import '../ui/page/understanding/element_lifecycle_page.dart';
import '../ui/page/understanding/frame_page.dart';
import '../ui/page/understanding/layout/layout_page.dart';
import '../ui/page/understanding/painting/paint_page.dart';

final List<GetPage> understandingRoutes = [
  GetPage(name: AppRoutes.element, page: () => ElementLifecyclePage()),
  GetPage(name: AppRoutes.frame, page: () => FramePage()),
  GetPage(name: AppRoutes.layout, page: () => LayoutPage()),
  GetPage(name: AppRoutes.painting, page: () => PaintPage()),
  GetPage(name: AppRoutes.compositing, page: () => CompositingPage()),
];
