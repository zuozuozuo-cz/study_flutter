import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aipptwidget extends StatefulWidget {
  const Aipptwidget({super.key});

  @override
  State<Aipptwidget> createState() => _AipptwidgetState();
}

class _AipptwidgetState extends State<Aipptwidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: getTopInputWidget(),
        ),
        SliverPersistentHeader(
          pinned: true, // 是否吸顶
          delegate: MyHeaderDelegate(),
        ),
      ],
    );
  }

  Widget getTopInputWidget() {
    final List<String> fruits = [
      'Apple', 'Banana', 'Orange', 'Mango', 'Pineapple',
      'Grapes', 'Strawberry', 'Blueberry', 'Watermelon', 'Peach',
      'Cherry', 'Lemon', 'Lime', 'Kiwi', 'Papaya',
      'Guava', 'Pear', 'Plum', 'Coconut', 'Pomegranate',
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // 淡灰色背景
          borderRadius: BorderRadius.circular(8), // 圆角 8
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 水平水果列表
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: fruits.length,
                scrollDirection: Axis.horizontal,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        fruits[index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // 输入框
            SizedBox(
              height: 200,
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '请输入内容...',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text('好多PPT', style: TextStyle(fontSize: 16)),
    );
  }

  @override
  double get maxExtent => 30;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
