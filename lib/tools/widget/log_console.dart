import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/LogCollector.dart';

/// 日志展示控件
class LogConsole extends StatefulWidget {
  /// 控制台高度
  final double height;

  /// 字体大小
  final double fontSize;

  const LogConsole({super.key, this.fontSize = 12, this.height = 200});

  @override
  State<LogConsole> createState() => _LogConsoleState();
}

class _LogConsoleState extends State<LogConsole> {
  /// 获取日志控制器，需要通过 put方法先注册
  final controller = Get.find<LogCollector>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.all(8),
      color: Color(0xFFEEEEEE),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '📝 日志输出',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: controller.clearLog,
                tooltip: '清空日志',
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),

          ///日志展示区域
          Expanded(child: Obx(() {
            return SingleChildScrollView(
              child: Text(
                controller.logs.join('\n'),
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontFamily: 'monospace',
                  color: Colors.black87,
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
