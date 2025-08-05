import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintPage extends StatefulWidget {
  const PaintPage({super.key});

  @override
  State<PaintPage> createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 300,height: 300,color: Colors.amber,
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('绘制理解Demo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          drawPicture();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void drawPicture() {
    // 创建绘制记录器和Canvas
    PictureRecorder recorder = PictureRecorder();
    Canvas canvas = Canvas(recorder);

    // 在指定的区域绘制
    var rect = Rect.fromLTWH(30, 200, 300, 300);


  }
}
