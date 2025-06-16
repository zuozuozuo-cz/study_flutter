import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/device_type_widget.dart';

class TabletTestPage extends StatefulWidget {
  const TabletTestPage({super.key});

  @override
  State<TabletTestPage> createState() => _TabletTestPageState();
}

class _TabletTestPageState extends State<TabletTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeviceTypeWidget 示例')),
      body: DeviceTypeWidget(
        forceTabletLandscape: true,
        phone: Center(child: Text('📱 手机布局', style: TextStyle(fontSize: 24))),
        tablet: Center(child: Text('💻 平板布局', style: TextStyle(fontSize: 36))),
      ),
    );
  }
}
