import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// 定义一个类别命名，将TextAlignVertical 命名为VerticalAlign
typedef VerticalAlign = TextAlignVertical;

/// 继承自多子widget的 MultiChildRenderObjectWidget
class LeftRightBox extends MultiChildRenderObjectWidget {
  final VerticalAlign verticalAlign;

  LeftRightBox(
      {Key? key,
      required Widget left,
      Widget? right,
      this.verticalAlign = VerticalAlign.top})
      : super(key: key, children: [left, if (right != null) right]);

  @override
  RenderObject createRenderObject(BuildContext context) {
   return _RenderLeftRight(verticalAlign);
  }

  @override
  void updateRenderObject(context, _RenderLeftRight renderObject) {
    renderObject.verticalAlign = verticalAlign;
  }
}

/// 继承 RenderBox 混入 ContainerRenderObjectMixin 处理 多子节点处理能力
/// RenderBoxContainerDefaultsMixin 在 ContainerRenderObjectMixin 基础上，
/// 提供了默认的遍历、绘制、命中测试等常用逻辑
class _RenderLeftRight extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _leftRightParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _leftRightParentData> {
  VerticalAlign verticalAlign;

  _RenderLeftRight(this.verticalAlign);

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! _leftRightParentData) {
      child.parentData = _leftRightParentData();
    }
  }

  /// 执行 Layout逻辑
  @override
  void performLayout() {
    // 获取父节点穿来的约束
    final BoxConstraints constraints = this.constraints;
    RenderBox leftChild = firstChild!;
    _leftRightParentData childParentData = leftChild.parentData! as _leftRightParentData;
    RenderBox? rightChild = childParentData.nextSibling;
    double rightChildWidth = .0;
    double rightChildHeight = .0;

    if (rightChild != null) {
      // 限制右边的子Widget 宽度不能超过父节点的一半
      rightChild.layout(
          constraints.copyWith(minWidth: 0, maxWidth: constraints.maxWidth / 2),
          parentUsesSize: true);

      rightChildWidth = rightChild.size.width;
      rightChildHeight = rightChild.size.height;

      // 跳转右Widget的位置
      _leftRightParentData rightParentData =
          rightChild.parentData! as _leftRightParentData;
      rightParentData.offset =
          Offset(constraints.maxWidth - rightChildWidth, 0);
    }

    leftChild.layout(
        constraints.copyWith(
            minWidth: 0, maxWidth: constraints.maxWidth - rightChildWidth),
        parentUsesSize: true);

    size = Size(
        constraints.maxWidth, max(leftChild.size.height, rightChildHeight));
    // 处理垂直对齐
    if (verticalAlign.y != -1) {
      RenderBox? needAlignChild;
      if (leftChild.size.height < size.height) {
        needAlignChild = leftChild;
      } else if (rightChild != null && rightChildHeight < size.height) {
        needAlignChild = rightChild;
      }

      if (needAlignChild != null) {
        childParentData = needAlignChild.parentData as _leftRightParentData;
        if (verticalAlign.y == 0) {
          childParentData.offset = Offset(childParentData.offset.dx,
              (size.height - needAlignChild.size.height) / 2);
        } else {
          childParentData.offset = Offset(childParentData.offset.dx,
              (size.height - needAlignChild.size.height));
        }
      }
    }
  }


  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

}

/// 定义 _leftRightParentData 继承自 ContainerBoxParentData
/// 用于Layout的时候 保存Offset信息
class _leftRightParentData extends ContainerBoxParentData<RenderBox> {}
