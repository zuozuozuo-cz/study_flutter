import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeepOffsetDemoPage extends StatefulWidget {
  const KeepOffsetDemoPage({super.key});

  @override
  State<KeepOffsetDemoPage> createState() => _KeepOffsetDemoPageState();
}

class _KeepOffsetDemoPageState extends State<KeepOffsetDemoPage> {
  bool _keepScrollOffset = true;
  final PageStorageBucket _bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Offset Demo'),
        centerTitle: true,
        actions: [
          Switch(
              value: _keepScrollOffset,
              onChanged: (val) {
                setState(() {
                  _keepScrollOffset = val;
                });
              })
        ],
      ),
      body: PageStorage(
        bucket: _bucket,
        child: IndexedStack(
          index: 0,
          children: [ScrollPage(
            key: ValueKey(_keepScrollOffset),
            keepScrollOffset: _keepScrollOffset,
          )],
        ),
      ),
    );
  }
}

class ScrollPage extends StatefulWidget {
  final bool keepScrollOffset;

  const ScrollPage({super.key, required this.keepScrollOffset});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
        keepScrollOffset: widget.keepScrollOffset, initialScrollOffset: 150.0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('🌀 keepScrollOffset = ${widget.keepScrollOffset}');
    return ListView.builder(
      itemBuilder: (_, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
      key: PageStorageKey('aaa'),
      controller: _scrollController,
      itemCount: 100,
    );
  }
}
