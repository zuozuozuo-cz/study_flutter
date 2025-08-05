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
      // child根据约束执行Layout操作，继而计算出child的size
      child!.layout(constraints, parentUsesSize: true);
      // 通过child的size，交换宽高，获取当前Widget(即CustomRotatedBox)的size
      size = Size(child!.size.height, child!.size.width);
      _paintTransform = Matrix4.identity()// 创建一个矩阵
      ..translate(size.width/2.0,size.height/2.0)// 转移旋转中心，设置为控件的中心
      ..rotateZ(math.pi/2)// 设置旋转角度
      ..translate(-child!.size.width/2.0,-child!.size.height / 2.0);// 校正子控件原点
    }else {
      size = constraints.smallest;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if(child != null && _paintTransform != null){
      // 结合Offset，把坐标系的原点平移到当前父控件所在的Offset上
      final Matrix4 transform =  Matrix4.translationValues(offset.dx, offset.dy, 0.0)
          ..multiply(_paintTransform!) // 将上面设置好的旋转矩阵，设置给当前矩阵
          ..translate(-offset.dx,-offset.dy);// 把坐标系原点复位
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
