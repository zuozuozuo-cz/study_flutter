import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/widget/tab2Widget.dart';
import 'package:study_flutter/widget/tab1_widget.dart';

class CustomScrollPage extends StatefulWidget {
  CustomScrollPage({super.key});

  @override
  State<CustomScrollPage> createState() => _CustomScrollPageState();
}

class _CustomScrollPageState extends State<CustomScrollPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [Tab(text: 'Tab1'), Tab(text: 'Tab2')];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('综合滑动案例'), centerTitle: true),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const Text('沧海月明珠有泪，蓝天日暖玉生烟'),
            TabBar(
              tabs: _tabs,
              labelColor: Colors.amber,
              unselectedLabelColor: Colors.blue,
              indicatorColor: Colors.deepOrange,
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Container(
                  color: Colors.cyan,
                  child: const Center(child: Tab1Widget()),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(
                    child: Tab2Widget(),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
