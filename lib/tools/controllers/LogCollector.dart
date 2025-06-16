import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// 收集和管理日志
class LogCollector extends GetxController {
  /// 日志缓存在这里，自动响应变化
  final RxList<String> logs = <String>[].obs;

  void log(String message) {
    logs.add(message);

    /// 控制日志最大长度
    if (logs.length > 5000) {
      logs.removeRange(0, logs.length - 5000);
    }
  }

  void safeLog(String message){
    WidgetsBinding.instance.addPostFrameCallback((_){
      log(message);
    });
  }

  /// 清空日志
  void clearLog() => logs.clear();
}
