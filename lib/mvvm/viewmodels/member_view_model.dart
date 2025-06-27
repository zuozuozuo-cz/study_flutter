import 'package:get/get.dart';
import 'package:study_flutter/mvvm/models/member_model.dart';
import 'package:study_flutter/mvvm/services/member_service.dart';

/// 负责成员数据管理的控制器，衔接 View层和model 层
/// 继承自 GetxController 方便使用GetX 的相应式 和生命周期管理
class MemberViewModel extends GetxController {
  /// 注入成员服务，用于发起网络数据获取成员数据
  final MemberService _memberService = MemberService();

  /// 成员列表，使用RxList 进行响应式监听
  /// .obs 将普通的变量，变成响应式变量，UI监听它们变化自动刷新
  var members = <MemberModel>[].obs;

  /// 加载状态
  var isLoading = false.obs;

  Future<void> loadMembers() async {
    isLoading.value = true;

    try {
      /// 通过 Services 获取网络数据
      final result = await _memberService.fetchMembers();

      /// 更新数据，触发UI更新
      /// assignAll 快速替换 RxList 内容并且通知监听者
      members.assignAll(result);
    } catch (e) {
      Get.snackbar('错误', '加载成员失败 : $e');
      print('加载失败 : e = $e');
    } finally {
      isLoading.value = false;
    }
  }
}
