import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NestedScrollviewPage extends StatelessWidget {
  const NestedScrollviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innderBoxIsScroll) {
            return [
              SliverAppBar(
                title: const Text('嵌套ListView'),
                pinned: true,// 固定在顶部
                forceElevated: innderBoxIsScroll,
              ),
              // 构建一个SliverList
            ];
          }, body: ListView.builder(
        padding: const EdgeInsets.all(8),
        physics: const ClampingScrollPhysics(),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(
              child: Text('item $index'),
            ),
          );
        },
      )),
    );
  }
}
