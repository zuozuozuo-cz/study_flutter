import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// context 获取 父级widget 的属性demo
class ContextDemoPage extends StatelessWidget {
  const ContextDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('context 测试'),
        centerTitle: true,
      ),
      body: Container(
        /// context 即为BuilderContext 本质为Widget在Widget树中的句柄
        /// 可以利用其向上遍历，获取商机widget
        child: Builder(builder: (context) {
          Scaffold? scaffold =
              context.findAncestorWidgetOfExactType<Scaffold>();
          return (scaffold?.appBar as AppBar).title ?? Text('哈哈');
        }),
      ),
    );
  }
}
