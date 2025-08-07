import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab2Widget extends StatefulWidget {
  const Tab2Widget({super.key});

  @override
  State<Tab2Widget> createState() => _Tab2WidgetState();
}

class _Tab2WidgetState extends State<Tab2Widget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 模拟构建 20 个分类，每个分类下 30 条数据
  final Map<String, List<String>> mediaCategories = {
    for (int i = 1; i <= 20; i++)
      '分类 $i': List.generate(30, (j) => '分类 $i - 内容 ${j + 1}'),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: mediaCategories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // return CustomScrollView(
    //   slivers: [
    //     SliverToBoxAdapter(
    //       child: getTopInputWidget(),
    //     ),
    //     SliverPersistentHeader(
    //       pinned: true, // 是否吸顶
    //       delegate: MyHeaderDelegate(),
    //     ),
    //   ],
    // );
    final tabs = mediaCategories.keys.toList();
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: getTopInputWidget(),
            ),
            SliverPersistentHeader(
              delegate: _TabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.amber,
                  unselectedLabelColor: Colors.cyan,
                  indicatorColor: Colors.red,
                  tabs: tabs.map((e) {
                    return Tab(text: e);
                  }).toList(),
                ),
              ),
              pinned: true,
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((category) {
            final items = mediaCategories[category]!;
            return GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.5),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(80)),
                    alignment: Alignment.center,
                    child: Text(
                      items[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                });
          }).toList(),
        ));
  }

  Widget getTopInputWidget() {
    final List<String> fruits = [
      'Apple',
      'Banana',
      'Orange',
      'Mango',
      'Pineapple',
      'Grapes',
      'Strawberry',
      'Blueberry',
      'Watermelon',
      'Peach',
      'Cherry',
      'Lemon',
      'Lime',
      'Kiwi',
      'Papaya',
      'Guava',
      'Pear',
      'Plum',
      'Coconut',
      'Pomegranate',
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
            const SizedBox(
              height: 200,
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text('Tab2 吸顶', style: TextStyle(fontSize: 16)),
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

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _TabBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
