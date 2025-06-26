import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/widget/AiPPTWidget.dart';
import 'package:study_flutter/widget/ai_write_widget.dart';

class CustomScrollPage extends StatefulWidget {
  CustomScrollPage({super.key});

  @override
  State<CustomScrollPage> createState() => _CustomScrollPageState();
}

class _CustomScrollPageState extends State<CustomScrollPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [Tab(text: 'AI_写作'), Tab(text: 'AI_PPT')];

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
            Container(child: Text('沧海月明珠有泪，蓝天日暖玉生烟')),
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
                  child: Center(
                    child: AiWriteWidget()
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Aipptwidget(),
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
