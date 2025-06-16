import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollcontrollerDemoPage extends StatefulWidget {
  const ScrollcontrollerDemoPage({super.key});

  @override
  State<ScrollcontrollerDemoPage> createState() =>
      _ScrollcontrollerDemoPageState();
}

class _ScrollcontrollerDemoPageState extends State<ScrollcontrollerDemoPage> {
  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print('滚动位置 ------> ${_scrollController.offset}');
      if (_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('滚动控制demo'),
          centerTitle: true,
        ),
        body: Scrollbar(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text('$index === 沧海月明珠有泪'),);
              },
              itemCount: 100,
              itemExtent: 50.0,/// 设置每个item的高度，这样就不需要去动态测量，节省性能
              controller: _scrollController,
            )),

        floatingActionButton: showToTopBtn ? FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
                0, duration: Duration(microseconds: 2000), curve: Curves.ease);
          }, child: Icon(Icons.arrow_upward),) : null
    );
  }
}
