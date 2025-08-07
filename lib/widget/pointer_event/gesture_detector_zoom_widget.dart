import 'package:flutter/cupertino.dart';

class GestureDetectorZoomWidget extends StatefulWidget {
  const GestureDetectorZoomWidget({super.key});

  @override
  State<GestureDetectorZoomWidget> createState() => _GestureDetectorZoomWidgetState();
}

class _GestureDetectorZoomWidgetState extends State<GestureDetectorZoomWidget> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset(
          'assets/image/sbhpt_2.png',
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails details){
          setState(() {
            // 缩放倍数在0.8~10倍之间
            _width = 200*details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}
