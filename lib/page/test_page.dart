import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    // return Scrollable(viewportBuilder: (BuildContext context, ViewportOffset position){
    //   return Text('data');
    // });
    _scrollController.offset;
    _scrollController.jumpTo(0);
    //_scrollController.animateTo(offset, duration: duration, curve: curve)
    _scrollController.addListener((){
      print(_scrollController.offset);
    });
    // SliverPersistentHeader();
    return Container();
  }
}
