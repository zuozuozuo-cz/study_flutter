import 'package:get/get.dart';
import 'package:study_flutter/mvvm/viewmodels/member_view_model.dart';

class MemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberViewModel());
  }
}
