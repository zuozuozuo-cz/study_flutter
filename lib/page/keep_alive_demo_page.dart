import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeepAliveDemoPage extends StatefulWidget {
  const KeepAliveDemoPage({super.key});

  @override
  State<KeepAliveDemoPage> createState() => _KeepAliveDemoPageState();
}

class _KeepAliveDemoPageState extends State<KeepAliveDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutomaticKeepAlive 演示'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return KeepAliveListItem(index: index);
        },
        addAutomaticKeepAlives: true,
        itemCount: 30,
      ),
    );
  }
}

class KeepAliveListItem extends StatefulWidget {
  final int index;

  const KeepAliveListItem({super.key, required this.index});

  @override
  State<KeepAliveListItem> createState() => _KeepAliveListItemState();
}

class _KeepAliveListItemState extends State<KeepAliveListItem>
    with AutomaticKeepAliveClientMixin {
  bool _keepAlive = false;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('🆕 initState: item ${widget.index}');
  }

  @override
  void dispose() {
    print('❌ dispose: item ${widget.index}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 必须重写这个，触发缓存的逻辑
    super.build(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text('${widget.index}'),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '计数：$_counter',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '是否缓存：$_keepAlive',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            )),
            Column(
              children: [
                Switch(
                    value: _keepAlive,
                    onChanged: (value) {
                      setState(() {
                        _keepAlive = value;
                        updateKeepAlive();
                      });
                    }),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 通过这个控制是否缓存
  @override
  bool get wantKeepAlive => _keepAlive;
}
