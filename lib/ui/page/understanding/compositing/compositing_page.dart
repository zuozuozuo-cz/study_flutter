import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/understanding/compositing/custom_rotated_box_new.dart';
import '../../../widget/understanding/compositing/custom_rotated_box_new_2.dart';


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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             ColoredBox(
                color: Colors.lightBlue,
                child: SizedBox(
                  width: 100,
                  height: 60,
                  child: Center(child: Text('A(正常)')),
                ),
              ),
              // Container(
              //   color: Colors.deepPurple,
              //   child: CustomRotatedBox(
              //     child: ColoredBox(
              //       color: Colors.amberAccent,
              //       child: SizedBox(
              //         width: 180,
              //         height: 60,
              //         child: Center(child: Text('A(CustomRotatedBox)')),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   color: Colors.deepPurple,
              //   child: CustomRotatedBox(
              //     child: RepaintBoundary(
              //       child: ColoredBox(
              //         color: Colors.deepOrangeAccent,
              //         child: SizedBox(
              //           width: 180,
              //           height: 60,
              //           child: Center(child: Text('A(RepaintBoundary)')),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // CustomRotatedBoxNew(
              //   child: RepaintBoundary(
              //     child: ColoredBox(
              //       color: Colors.green,
              //       child: SizedBox(
              //         width: 180,
              //         height: 60,
              //         child: Center(child: Text('A(CustomRotatedBoxNew)')),
              //       ),
              //     ),
              //   ),
              // ),
              CustomRotatedBoxNew(
                child: Center(
                  child: RepaintBoundary(
                    child: Text('A Center'),
                  ),
                ),
              ),
              CustomRotatedBoxNew2(
                child: Center(
                  child: Text('B'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
