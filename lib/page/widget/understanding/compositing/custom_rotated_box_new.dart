import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';



class CustomRotatedBox extends SingleChildRenderObjectWidget {
  CustomRotatedBox({Key? key, Widget? child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderRotatedBox();
  }
}

class CustomRenderRotatedBox extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  Matrix4? _paintTransform;

  @override
  void performLayout() {
    _paintTransform = null;
    if (child != null) {
      // 旋转90
      final BoxConstraints rotatedConstraints =
          BoxConstraints(minWidth: constraints.minHeight, maxHeight: constraints.maxHeight, minHeight: constraints.minWidth, maxWidth: constraints.maxHeight);
      child!.layout(rotatedConstraints, parentUsesSize: true);
      size = Size(child!.size.height, child!.size.width);
      _paintTransform = Matrix4.identity()
      ..translate(size.width/2.0,size.height/2.0)
      ..rotateZ(math.pi/2)
      ..translate(-child!.size.width/2.0,-child!.size.height / 2.0);
    }else {
      size = constraints.smallest;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if(child != null && _paintTransform != null){
      final Matrix4 transform =  Matrix4.translationValues(offset.dx, offset.dy, 0.0)
          ..multiply(_paintTransform!)
          ..translate(-offset.dx,-offset.dy);
      _paint(context,offset,transform);
    }
  }

  void _paint(PaintingContext context,Offset offset,Matrix4 transform){
    context.canvas
        ..save()
        ..transform(transform.storage);
    context.paintChild(child!, offset);
    context.canvas.restore();
  }

}
