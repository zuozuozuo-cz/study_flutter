import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/page/test/lifecycle_test_page.dart';
import '../ui/page/test/tablet_test_page.dart';
import '../ui/page/understanding/constraints/constraints_demo_page.dart';
import '../ui/page/understanding/context/context_demo_page.dart';
import '../ui/page/understanding/scroll/custom_scroll_page.dart';
import '../ui/page/understanding/scroll/keep_alive_demo_page.dart';
import '../ui/page/understanding/scroll/keep_offset_demo_page.dart';
import '../ui/page/understanding/scroll/scrollcontroller_demo_page.dart';
import '../ui/page/understanding/state/stateless_page.dart';
import 'app_routes.dart';

final List<GetPage> baseStudyRoutes = [
  GetPage(name: AppRoutes.stateless, page: () => StatelessPage()),
  GetPage(name: AppRoutes.contextDemo, page: () => ContextDemoPage()),
  GetPage(name: AppRoutes.lifecycle, page: () => LifecycleTestPage()),
  GetPage(name: AppRoutes.scrollController, page: () => ScrollcontrollerDemoPage()),
  GetPage(name: AppRoutes.keepOffset, page: () => KeepOffsetDemoPage()),
  GetPage(name: AppRoutes.constraints, page: () => ConstraintsDemoPage()),
  GetPage(name: AppRoutes.tablet, page: () => TabletTestPage()),
  GetPage(name: AppRoutes.keepAlive, page: () => KeepAliveDemoPage()),
  GetPage(name: AppRoutes.customScroll, page: () => CustomScrollPage()),
];
