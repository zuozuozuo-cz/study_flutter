import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/main.dart';
import 'package:study_flutter/page/widget/understanding/compositing/custom_rotated_box.dart';

class CompositingPage extends StatefulWidget {
  const CompositingPage({super.key});

  @override
  State<CompositingPage> createState() => _CompositingPageState();
}

class _CompositingPageState extends State<CompositingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('旋转Demo'),centerTitle: true,),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         ColoredBox(
            color: Colors.lightBlue,
            child: SizedBox(
              width: 100,
              height: 60,
              child: Center(child: Text('A(正常)')),
            ),
          ),
          SizedBox(width: 10,),
          Center(
            child: CustomRotatedBox(
              child: ColoredBox(
                color: Colors.amberAccent,
                child: SizedBox(
                  width: 180,
                  height: 60,
                  child: Center(child: Text('A(CustomRotatedBox)')),
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          Center(
            child: CustomRotatedBox(
              child: RepaintBoundary(
                child: ColoredBox(
                  color: Colors.deepOrangeAccent,
                  child: SizedBox(
                    width: 100,
                    height: 60,
                    child: Center(child: Text('A(RepaintBoundary)')),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
