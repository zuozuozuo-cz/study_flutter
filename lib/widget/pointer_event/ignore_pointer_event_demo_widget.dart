import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IgnorePointerEventDemoWidget extends StatefulWidget {
  const IgnorePointerEventDemoWidget({super.key});

  @override
  State<IgnorePointerEventDemoWidget> createState() => _IgnorePointerEventDemoWidgetState();
}

class _IgnorePointerEventDemoWidgetState extends State<IgnorePointerEventDemoWidget> {
  String text1 = '';
  String text2 = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Listener(
            onPointerDown: (event){
              setState(() {
                text1 = 'AbsorbPointer -> out';
              });
            },
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  width: 200,
                  height: 100,
                  child: Text(text1),
                ),
                onPointerDown: (event) {
                  setState(() {
                    text1 = 'AbsorbPointer -> in';
                  });
                },
              ),

            ),
          ),
          SizedBox(height: 20,),
          Listener(
            onPointerDown: (event) {
              setState(() {
                text2 = 'IgnorePointer -> out';
              });
            },
            child: IgnorePointer(
              child: Listener(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  width: 200,
                  height: 100,
                  child: Text(text2),
                ),
                onPointerDown: (event) {
                  setState(() {
                    text2 = 'IgnorePointer -> in';
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
