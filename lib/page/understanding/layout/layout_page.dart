import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/page/widget/understanding/layout/custom_center.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局过程（layout）的理解Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomCenter(child: Container(width: 180,height: 180,color: Colors.amber,))
        ],
      ),
    );
  }
}
