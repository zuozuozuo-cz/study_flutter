import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/widget/pointer_event/drag_demo_widget.dart';
import 'package:study_flutter/widget/pointer_event/ignore_pointer_event_demo_widget.dart';
import 'package:study_flutter/widget/pointer_event/listener_demo_widget.dart';
import 'package:study_flutter/widget/pointer_event/pointer_down_listener.dart';
import 'package:study_flutter/widget/pointer_event/water_mask_test_widget.dart';

import '../../../../widget/pointer_event/gesture_detector_demo_widget.dart';
import '../../../../widget/pointer_event/gesture_detector_zoom_widget.dart';
import '../../../../widget/pointer_event/gesture_recognizer_widget.dart';

class PointerEventPage extends StatefulWidget {
  const PointerEventPage({super.key});

  @override
  State<PointerEventPage> createState() => _PointerEventPageState();
}

class _PointerEventPageState extends State<PointerEventPage> {
  String _text = '啊啊啊';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件处理'),
        centerTitle: true,
      ),
      body: Center(child: WaterMaskTestWidget()),

      /// Listener 事件指针监听
      //body: Center(child: ListenerDemoWidget())
      /// 屏蔽 Listener 的事件指针的监听
      // body: IgnorePointerEventDemoWidget(),
      /// GestureDetector 监听 点击、双击、长按、
      // body: GestureDetectorDemoWidget(),
      /// GestureDetector 监听拖动等事件
      //body: DragDemoWidget(),
      /// GestureDetector 监听缩放事件
      //body: GestureDetectorZoomWidget(),
      /// 富文本点击变色
      //body: GestureRecognizerWidget(),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Container(
      //         color: Colors.deepOrange,
      //         height: 200,
      //         width: 200,
      //         alignment: Alignment.center,
      //         child: PointerDownListener(
      //           child: Text('点击',
      //               style: TextStyle(
      //                 fontSize: 20,
      //               )),
      //           onPointerDown: (event) {
      //             setState(() {
      //               _text = '点击:${event.localPosition.distance}';
      //             });
      //           },
      //         ),
      //       ),
      //       Text(
      //         _text,
      //         style: TextStyle(
      //           fontSize: 20,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
