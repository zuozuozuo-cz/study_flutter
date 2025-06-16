import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// StatelessWidget 生命周期演示
class StatelessPage extends StatefulWidget {
  const StatelessPage({super.key});

  @override
  State<StatelessPage> createState() => _StatelessPageState();
}

class _StatelessPageState extends State<StatelessPage> {
  bool toggle = false;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatelessPage'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      toggle = !toggle;
                    });
                  },
                  child: const Text('toggle')),
              SizedBox(
                height: 30,
              ),
              StatelessBox(
                  // key: ValueKey(random.nextInt(10)),///key不相同就不会复用element
                  key: ValueKey(1),
                  /// key相同就会复用element
                  color: toggle ? Colors.blue : Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

/// StatelessWidget 没有维护状态（State），可以理解为没有 生命周期
/// 每次刷新都会重新调用 构造方法 即为 重新创建一个 widget 继而调用其 build方法
/// 但是 Element 却可以复用，是否复用具体看 widget.canUpdate方法
/// 若 widget.canUpdate 返回为true 则证明这个element 可以复用，返回为false则不可以复用，
/// 这方法本质就是判断新旧两个widget的runtimeType 和 key
class StatelessBox extends StatelessWidget {
  final Color color;

  StatelessBox({Key? key, required this.color}) : super(key: key) {
    print('🔥 StatelessBox constructor called with color: $color');
    print('🔥 StatelessBox constructor called with key: $key');
  }

  @override
  StatelessElement createElement() {
    print('🧩 StatelessBox createElement called');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print('🔁 build StatelessBox with color $color ====== key $key');
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
