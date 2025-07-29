import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccurateSizedBox extends SingleChildRenderObjectWidget {
  final double width;
  final double height;

  AccurateSizedBox({
    Key? key,
    this.width = 0,
    this.height = 0,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  void updateRenderObject(BuildContext context, RenderAccurateSizedBox renderObject) {
    renderObject
      ..width = width
      ..height = height;
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAccurateSizedBox(width, height);
  }
}

class RenderAccurateSizedBox extends RenderProxyBoxWithHitTestBehavior {
  double width;
  double height;

  RenderAccurateSizedBox(this.width, this.height);

  /// 当前组件大小只取决于父组件传递的约束
  @override
  bool get sizedByParent => true;

  /// performResize中会调用
  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    // 设置当前元素的宽高，遵守父组件的约束
    return constraints.constrain(Size(width, height));
  }

  @override
  void performLayout() {
    child!.layout(BoxConstraints.tight(Size(min(size.width, width), min(size.height, height))),

        /// parentUsesSize 为false的时候，子组件的布局边界会是它的自身
        /// 子组件布局发生变化不会影响当前组件
        parentUsesSize: false);
  }
}
