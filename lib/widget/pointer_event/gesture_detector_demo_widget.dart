import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDetectorDemoWidget extends StatefulWidget {
  const GestureDetectorDemoWidget({super.key});

  @override
  State<GestureDetectorDemoWidget> createState() => _GestureDetectorDemoWidgetState();
}

class _GestureDetectorDemoWidgetState extends State<GestureDetectorDemoWidget> {
  String _operation = 'No Gesture detected!';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.cyan,
          width: 200,
          height: 100,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          updateText('Tap');
        },
        onDoubleTap: () {
          updateText('DoubleTap');
        },
        onLongPress: () {
          updateText('LongPress');
        },
      ),
    );
  }

  void updateText(String s) {
    setState(() {
      _operation = s;
    });
  }
}
