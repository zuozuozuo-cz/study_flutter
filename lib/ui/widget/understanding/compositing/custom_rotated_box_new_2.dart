import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:study_flutter/main.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';

class CustomRotatedBoxNew2 extends SingleChildRenderObjectWidget {
  CustomRotatedBoxNew2({Key? key, Widget? child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderRotatedBoxNew2();
  }
}

class CustomRenderRotatedBoxNew2 extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  Matrix4? _paintTransform;

  @override
  void performLayout() {
    _paintTransform = null;
    if (child != null) {
      child!.layout(constraints, parentUsesSize: true);
      size = child!.size;
      // 设置旋转矩阵
      _paintTransform = Matrix4.identity()
        ..translate(size.width / 2.0, size.height / 2.0)
        ..rotateZ(math.pi / 2)
        ..translate(-child!.size.width / 2.0, -child!.size.height / 2.0);
    } else {
      size = constraints.smallest;
    }
  }

  final LayerHandle<TransformLayer> _transformLayer = LayerHandle<TransformLayer>();

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      _transformLayer.layer = context.pushTransform(needsCompositing, offset, _paintTransform!, _paintChild);
    }else {
      _transformLayer.layer = null;
    }
  }

  void _paintChild(PaintingContext context, Offset offset) {
    logger.d('CustomRenderRotatedBoxNew2 ----------> paint Child ');
    context.paintChild(child!, offset);
  }

  @override
  void dispose() {
    _transformLayer.layer = null;
    super.dispose();
  }

  @override
  void applyPaintTransform(covariant RenderObject child, Matrix4 transform) {
    if(_paintTransform != null) transform.multiply(_paintTransform!);
    super.applyPaintTransform(child, transform);
  }
}
