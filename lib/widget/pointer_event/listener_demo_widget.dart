import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListenerDemoWidget extends StatefulWidget {
  const ListenerDemoWidget({super.key});

  @override
  State<ListenerDemoWidget> createState() => _ListenerDemoWidgetState();
}

class _ListenerDemoWidgetState extends State<ListenerDemoWidget> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event){
        setState(() {
          _event = event;
        });
      },
      onPointerMove: (PointerMoveEvent event){
        setState(() {
          _event = event;
        });
      },
      onPointerUp: (PointerUpEvent event){
        setState(() {
          _event = event;
        });
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        width: 300,
        height: 150,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
