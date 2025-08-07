import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerWidget extends StatefulWidget {
  const GestureRecognizerWidget({super.key});

  @override
  State<GestureRecognizerWidget> createState() => _GestureRecognizerWidgetState();
}

class _GestureRecognizerWidgetState extends State<GestureRecognizerWidget> {
  // 点击监听
  TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: '沧海月明珠有泪'),
        TextSpan(
            text: '点我变色',
            style: TextStyle(fontSize: 30.0, color: _toggle ? Colors.cyan : Colors.red),
            recognizer: tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }),
        TextSpan(text: '蓝田日暖玉生烟')
      ])),
    );
  }

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }
}
