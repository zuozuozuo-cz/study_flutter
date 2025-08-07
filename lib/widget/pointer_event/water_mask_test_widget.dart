import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/main.dart';
import 'package:study_flutter/widget/pointer_event/hit_test_blocker.dart';

class WaterMaskTestWidget extends StatelessWidget {
  const WaterMaskTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        wChild(1,Colors.green,200),
        Container(
          width: 150,
          height: 150,
          color: Colors.lightBlue,
        )
      ],
    );
    // return Stack(
    //   children: [
    //     HitTestBlocker(child: wChild(1, Colors.green, 300)),
    //     HitTestBlocker(child: wChild(2, Colors.deepOrangeAccent, 100)),
    //   ],
    // );
  }

  Widget wChild(int index, Color color, double size) {
    return Listener(
      onPointerDown: (e)=> logger.d('wChild ----------> index = $index'),
      child: Container(
        width: size,
        height: size,
        color: color,
      ),
    );
  }
}
