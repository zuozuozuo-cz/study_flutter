import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class LifecycleTestPage extends StatefulWidget {
  const LifecycleTestPage({super.key});

  @override
  State<LifecycleTestPage> createState() => _LifecycleTestPageState();
}

class _LifecycleTestPageState extends State<LifecycleTestPage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: TestPage(
        onThemeToggle: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const TestPage({super.key, required this.onThemeToggle});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool showChild = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 生命周期演示'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showChild) LifecycleDemoWidget(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => setState(() {
                    showChild = !showChild;
                  }),
              child: Text(showChild ? '卸载子组件' : '挂载子组件')),
          ElevatedButton(
              onPressed: widget.onThemeToggle,
              child: Text('切换 Theme 触发 didChangeDependencies')),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class LifecycleDemoWidget extends StatefulWidget {
  const LifecycleDemoWidget({super.key});

  @override
  State<LifecycleDemoWidget> createState() => _LifecycleDemoWidgetState();
}

class _LifecycleDemoWidgetState extends State<LifecycleDemoWidget> {

  /// widget 插入到 widget 树中调用，
  @override
  void initState() {
    super.initState();
    print('🟢  _LifeCycle ----------> initState');
  }

  /// 依赖的 InheritedWidget 发生变化的时候，例如切换主题等等
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('🟡  _LifeCycle ----------> didChangeDependencies');
    Theme.of(context);
  }

  @override /// widget 重建的时候，如果widget.canUpdate方法返回为
  void didUpdateWidget(covariant LifecycleDemoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('🟠  _LifeCycle ----------> didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是子组件'),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('🔴  _LifeCycle ----------> deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('⚫  _LifeCycle ----------> dispose');
  }
}
