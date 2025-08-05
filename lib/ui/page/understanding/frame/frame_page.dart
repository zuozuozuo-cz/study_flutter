import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/main.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    logger.d('message-frame --------> [build] 构建组件树');
    return Scaffold(
      appBar: AppBar(
        title: Text('手动调度 Frame Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '当前帧编号:$_counter',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logger.d('message-frame --------> [按钮点击] scheduleFrame() 请求下一帧');
          setState(() {
            _counter++; // 修改状态
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
