import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/main.dart';

import '../../../widget/understanding/layout/accurate_sized_box.dart';

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
          // CustomCenter(
          //     child: Container(
          //   width: 180,
          //   height: 180,
          //   color: Colors.amber,
          // )),
          // LeftRightBox(
          //   left: Text('左边'),
          //   right: Text('右边'),
          // ),
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tight(const Size(150, 150)),
                child: SizedBox(
                  width: 800,/// 这里设置800 但是无效，采用的就是150*150
                  height: 800,
                  child: Container(
                    width: 800, /// 这里设置800 但是无效，采用的就是150*150
                    height: 800,
                    child: Text('SizedBox 设置'),
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  color: Colors.amber,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(150, 150)),
                    child: AccurateSizedBox(
                      width: 100,
                      height: 100,
                      child: Container(
                        width: 50, /// 这里设置50 但是无效，采用的就是100*100
                        height: 50,
                        child: Text('AccurateSizedBox 设置'),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
