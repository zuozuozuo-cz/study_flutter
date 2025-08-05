import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollviewDemoPage extends StatefulWidget {
  const CustomScrollviewDemoPage({super.key});

  @override
  State<CustomScrollviewDemoPage> createState() =>
      _CustomScrollviewDemoPageState();
}

class _CustomScrollviewDemoPageState extends State<CustomScrollviewDemoPage> {
  @override
  Widget build(BuildContext context) {
    // return buildTwoList();
    return buildTwoSliverList();
  }

  Column buildTwoList() {
    var Listview = ListView.builder(itemBuilder: (_, index) {
      return ListTile(
        title: Text('$index'),
      );
    });
    return Column(
      children: [
        Expanded(child: Listview),
        Divider(
          color: Colors.black12,
        ),
        Expanded(child: Listview),
      ],
    );
  }

  Widget buildTwoSliverList() {
    /// 创建一个item高度相同的Sliver
    var listView = SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((_, index) {
          return ListTile(title: Text('$index'));
        }, childCount: 10),
        itemExtent: 56);

    return CustomScrollView(
      slivers: [listView, listView],
    );
  }
}
