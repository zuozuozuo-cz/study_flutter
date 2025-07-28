import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef VerticalAlign = TextAlignVertical;

class LeftRightBox extends MultiChildRenderObjectWidget {
  final VerticalAlign verticalAlign;

  LeftRightBox({Key? key, required Widget left, Widget? right, this.verticalAlign = VerticalAlign.top})
      : super(key: key, children: [left, if (right != null) right]);

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }
}

class _RenderLeftRight extends RenderBox
    with ContainerRenderObjectMixin<RenderBox, _leftRightParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _leftRightParentData> {
  
}

class _leftRightParentData extends ContainerBoxParentData<RenderBox> {}
