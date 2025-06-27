import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:study_flutter/mvvm/bindings/member_binding.dart';

import '../mvvm/views/snh_member_list_page.dart';
import 'app_routes.dart';

final List<GetPage> demoRoutes = [
  GetPage(
      /// 路由地址
      name: AppRoutes.demoSnh,
      /// 对应页面
      page: () => SnhMemberListPage(),
      /// 页面对应的binding
      binding: MemberBinding()),
];
