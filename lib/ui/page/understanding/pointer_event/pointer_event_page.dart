import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointerEventPage extends StatefulWidget {
  const PointerEventPage({super.key});

  @override
  State<PointerEventPage> createState() => _PointerEventPageState();
}

class _PointerEventPageState extends State<PointerEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('事件处理'),centerTitle: true,),
      body: Container(
        color: Colors.cyan,
      ),
    );
  }
}
