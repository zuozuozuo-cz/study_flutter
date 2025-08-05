import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';

class CustomRotatedBoxNew extends SingleChildRenderObjectWidget {
  CustomRotatedBoxNew({Key? key, Widget? child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderRotatedBoxNew();
  }
}

class CustomRenderRotatedBoxNew extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
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
        ..translate(size.width / 2.0, size.height / 2.0)
        ..rotateZ(math.pi / 2)
        ..translate(-child!.size.width / 2.0, -child!.size.height / 2.0);
    } else {
      size = constraints.smallest;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    /// 版本一
    // if(child != null && _paintTransform != null){
    //   final Matrix4 transform =  Matrix4.translationValues(offset.dx, offset.dy, 0.0)
    //       ..multiply(_paintTransform!)
    //       ..translate(-offset.dx,-offset.dy);
    //   _paint(context,offset,transform);
    // }

    /// 版本二
    // if (child != null) {
    //   final Matrix4 transform =
    //   Matrix4.translationValues(offset.dx, offset.dy, 0.0)
    //     ..multiply(_paintTransform!)
    //     ..translate(-offset.dx, -offset.dy);
    //   if (child!.isRepaintBoundary) {
    //     _paintWithNewLayer(context, offset, transform);
    //   } else {
    //     _paint(context, offset, transform);
    //   }
    // }

    /// 版本三
    // if (child != null) {
    //   pushTransform(
    //     context,
    //     child!.isRepaintBoundary,
    //     offset,
    //     _paintTransform!,
    //     _paintChild,
    //     _transformLayer.layer,
    //   );
    // } else {
    //   _transformLayer.layer = null;
    // }

    /// 版本四
    // if (child != null) {
    //   context.pushTransform(child!.isRepaintBoundary, offset, _paintTransform!, _paintChild);
    // }

    /// 版本五
    if(child != null){
      context.pushTransform(needCompositing(), offset, _paintTransform!, _paintChild);
    }
  }

  TransformLayer? pushTransform(
      PaintingContext context, bool needsCompositing, Offset offset, Matrix4 transform, PaintingContextCallback painter, TransformLayer? oldLayer) {
    final Matrix4 effectiveTransform = Matrix4.translationValues(offset.dx, offset.dy, 0.0)
      ..multiply(transform)
      ..translate(-offset.dx, -offset.dy);

    if (needsCompositing) {
      final TransformLayer layer = oldLayer ?? TransformLayer();
      layer.transform = effectiveTransform;
      context.pushLayer(layer, painter, offset, childPaintBounds: MatrixUtils.inverseTransformRect(effectiveTransform, context.estimatedBounds));
      return layer;
    } else {
      context.canvas
        ..save()
        ..transform(effectiveTransform.storage);
      painter(context, offset);
      context.canvas.restore();
      return null;
    }
  }

  void _paint(PaintingContext context, Offset offset, Matrix4 transform) {
    context.canvas
      ..save()
      ..transform(transform.storage);
    context.paintChild(child!, offset);
    context.canvas.restore();
  }

  // 创建一个持有TransformLayer 的handle
  final LayerHandle<TransformLayer> _transformLayer = LayerHandle<TransformLayer>();

  void _paintWithNewLayer(PaintingContext context, Offset offset, Matrix4 transform) {
    // 创建一个 TransformLayer，保存在handle中
    _transformLayer.layer = _transformLayer.layer ?? TransformLayer();
    _transformLayer.layer!.transform = transform;
    context.pushLayer(_transformLayer.layer!, _paintChild, offset, childPaintBounds: MatrixUtils.inverseTransformRect(transform, offset & size));
  }

  void _paintChild(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
  }

  needCompositing() {
    bool result = false;
    _visit(RenderObject child) {
      // if (child.isRepaintBoundary) {
      if(child.isRepaintBoundary || child.alwaysNeedsCompositing){
        result = true;
        return;
      } else {
        child.visitChildren(_visit);
      }
    }

    visitChildren(_visit);
    return result;
  }
}
