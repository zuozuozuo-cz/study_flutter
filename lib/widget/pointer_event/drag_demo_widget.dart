import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragDemoWidget extends StatefulWidget {
  const DragDemoWidget({super.key});

  @override
  State<DragDemoWidget> createState() => _DragDemoWidgetState();
}

class _DragDemoWidgetState extends State<DragDemoWidget> {
  double _top1 = 0.0;
  double _left1 = 0.0;
  String _text1 = '';

  double _top2 = 0.0;
  String _text2 = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top1,
            left: _left1,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onPanDown: (DragDownDetails e){
                setState(() {
                  _text1 = '用户手指按下:${e.globalPosition}';
                });
              },
              onPanUpdate: (DragUpdateDetails e){
                setState(() {
                  _left1 += e.delta.dx;
                  _top1 += e.delta.dy;
                  _text1 = '手指滑动:${e.globalPosition}';
                });
              },
              onPanEnd: (DragEndDetails e){
                setState(() {
                  _text1 = '滑动结束时在x,y轴上的速度:${e.velocity}';
                });
              },
            )),
        Positioned(
            left: 50,
            top:50 + _top2,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("B"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _top2 += details.delta.dy;
                  _text2 = '用户垂直方向拖动：${details.delta.dy}';
                });
              },
            )),
        Positioned(
          child: Center(child: Text(_text2)),
          bottom: 150,
          left: 0,
          right: 0,
        )
      ],
    );
  }
}
