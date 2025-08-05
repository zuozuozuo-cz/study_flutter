import 'package:study_flutter/routes/base_study_routes.dart';
import 'package:study_flutter/routes/demo_routes.dart';
import 'package:study_flutter/routes/main_routes.dart';
import 'package:study_flutter/routes/test_routes.dart';
import 'package:study_flutter/routes/understanding_routes.dart';

class AppPages {
  static final routes = [
    ...mainRoutes,
    ...demoRoutes,
    ...understandingRoutes,
    ...baseStudyRoutes,
    ...testRoutes,
  ];
}
