import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElementLifecyclePage extends StatefulWidget {
  const ElementLifecyclePage({super.key});

  @override
  State<ElementLifecyclePage> createState() => _ElementLifecyclePageState();
}

class _ElementLifecyclePageState extends State<ElementLifecyclePage> {
  /// 用来切换不同的widget，触发canUpdate 判断
  bool toggleWidgetType = true;

  /// 控制子widget 是否显示，触发 deactivate
  bool showChild = true;

  /// 控制用Global Key 复用元素，触发 activate
  bool moveWithGlobalKey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Element 生命周期演示'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                '说明：通过控制开关，观察Element 的生命周期\n',
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      toggleWidgetType = !toggleWidgetType;
                    });
                  },
                  child: Text('切换 widget 类型(key和runtime)')),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showChild = !showChild;
                  });
                },
                child: Text(showChild ? '移除子 widget (deactivate)' : '添加子 widget (activate)'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    moveWithGlobalKey = !moveWithGlobalKey;
                  });
                },
                child: Text(moveWithGlobalKey ? '关闭 GlobalKey的复用' : '开启GlobalKey的复用'),
              ),
              const Divider(
                height: 32,
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(child: _buildLeftColumn()),
                  const VerticalDivider(),
                  Expanded(child: _buildRightColumn())
                ],
              ))
            ],
          )),
    );
  }

  _buildLeftColumn() {
    if (!showChild) {
      ///祖先调用 deactivatedChild 移除 element，element 进入 inactive(deactivate)
      return const Center(
        child: Text('子 widget 已经移除'),
      );
    }

    if (moveWithGlobalKey) {
      /// 用GlobalKey 强制复用 element 元素从这里移动到右边
      return GlobalKeyChild(
        key: GlobalObjectKey('global'),
        label: 'GlobalKey widget',
      );
    }

    // 根据 toggleWidgetType 切换不同 Widget，key/runtimeType 不同决定是否复用
    if (toggleWidgetType) {
      return MyElementWidget(key: const ValueKey('A'), label: 'Widget A');
    } else {
      return MyElementWidget(key: const ValueKey('B'), label: 'Widget B');
    }
  }

  _buildRightColumn() {
    if (!showChild) {
      return const Center(child: Text('子 Widget 已移除'));
    }

    if (moveWithGlobalKey) {
      // 右边显示 GlobalKey 控制的 Widget，激活同一个 Element
      return GlobalKeyChild(key: GlobalObjectKey('global'), label: 'GlobalKey Widget（移动到这里）');
    }

    // 右边默认空，观察切换效果
    return const SizedBox();
  }
}

class MyElementWidget extends StatefulWidget {
  final String label;

  const MyElementWidget({super.key, required this.label});

  @override
  State<MyElementWidget> createState() => _MyElementWidgetState();

  @override
  StatefulElement createElement() {
    print('[${label}] createElement called, key=$key');
    return super.createElement();
  }
}

class _MyElementWidgetState extends State<MyElementWidget> {
  @override
  void initState() {
    super.initState();
    print('[${widget.label}] initState (Element active)');
  }

  @override
  void didUpdateWidget(covariant MyElementWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[${widget.label}] didUpdateWidget, old=${oldWidget.label}');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('[${widget.label}] deactivate (Element inactive)');
  }

  @override
  void dispose() {
    super.dispose();
    print('[${widget.label}] dispose (Element defunct)');
  }

  @override
  Widget build(BuildContext context) {
    print('[${widget.label}] build');
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      color: Colors.blue[100],
      child: Text(widget.label, style: const TextStyle(fontSize: 18)),
    );
  }
}

class GlobalKeyChild extends StatefulWidget {
  final String label;

  const GlobalKeyChild({super.key, required this.label});

  @override
  State<GlobalKeyChild> createState() => _GlobalKeyChildState();

  @override
  StatefulElement createElement() {
    print('${label}] createElement called, key=$key (GlobalKey)');
    return super.createElement();
  }
}

class _GlobalKeyChildState extends State<GlobalKeyChild> {
  @override
  void initState() {
    super.initState();
    print('[${widget.label}] initState (Element active, GlobalKey)');
  }

  @override
  void didUpdateWidget(covariant GlobalKeyChild oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[${widget.label}] didUpdateWidget, old=${oldWidget.label} (GlobalKey)');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('[${widget.label}] deactivate (Element inactive, GlobalKey)');
  }

  @override
  void dispose() {
    super.dispose();
    print('[${widget.label}] dispose (Element defunct, GlobalKey)');
  }

  @override
  Widget build(BuildContext context) {
    print('[${widget.label}] build (GlobalKey)');
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      color: Colors.green[200],
      child: Text(widget.label, style: const TextStyle(fontSize: 18)),
    );
  }
}
