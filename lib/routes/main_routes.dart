import 'package:get/get_navigation/src/routes/get_route.dart';


import '../home_list_page.dart';
import '../ui/page/constraints_demo_page.dart';
import '../ui/page/context_demo_page.dart';
import '../ui/page/custom_scroll_page.dart';
import '../ui/page/keep_alive_demo_page.dart';
import '../ui/page/keep_offset_demo_page.dart';
import '../ui/page/lifecycle_test_page.dart';
import '../ui/page/scrollcontroller_demo_page.dart';
import '../ui/page/stateless_page.dart';
import '../ui/page/tablet_test_page.dart';
import 'app_routes.dart';

final List<GetPage> mainRoutes = [
  GetPage(name: AppRoutes.root, page: () => HomeListPage()),
  GetPage(name: AppRoutes.stateless, page: () => StatelessPage()),
  GetPage(name: AppRoutes.contextDemo, page: () => ContextDemoPage()),
  GetPage(name: AppRoutes.lifecycle, page: () => LifecycleTestPage()),
  GetPage(
      name: AppRoutes.scrollController, page: () => ScrollcontrollerDemoPage()),
  GetPage(name: AppRoutes.keepOffset, page: () => KeepOffsetDemoPage()),
  GetPage(name: AppRoutes.constraints, page: () => ConstraintsDemoPage()),
  GetPage(name: AppRoutes.tablet, page: () => TabletTestPage()),
  GetPage(name: AppRoutes.keepAlive, page: () => KeepAliveDemoPage()),
  GetPage(name: AppRoutes.customScroll, page: () => CustomScrollPage()),
];
