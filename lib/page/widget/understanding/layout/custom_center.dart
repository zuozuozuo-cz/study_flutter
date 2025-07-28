import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class CustomCenter extends SingleChildRenderObjectWidget {
  const CustomCenter({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCenter();
  }
}

class RenderCustomCenter extends RenderShiftedBox {
  RenderCustomCenter({RenderBox? renderBox}) : super(renderBox);

  @override
  void performLayout() {
    // super.performLayout();
    // 先对子组件进行layout，随后获取他的size
    child!.layout(constraints.loosen(), // 将约束传递给子控件
        parentUsesSize: true // 使用child的size，通过child的size来确定自己的大小偏移等
        );

    // 根据 child的大小来确定自己的带下
    size = constraints.constrain(Size(constraints.maxWidth == double.infinity ? child!.size.width : double.infinity,
        constraints.maxHeight == double.infinity ? child!.size.height : double.infinity));

    // 保证 size 是合法的、有边界的
    // 计算自己的尺寸（如果有限制，就用限制；否则就用 child 的 size）
    // final double width = constraints.hasBoundedWidth
    //     ? constraints.maxWidth
    //     : child!.size.width;
    // final double height = constraints.hasBoundedHeight
    //     ? constraints.maxHeight
    //     : child!.size.height;

    // size = constraints.constrain(Size(width, height));

    // 根据子控件和父控件的大小确定子控件在父控件的位置
    BoxParentData boxParentData = child!.parentData as BoxParentData;
    boxParentData.offset = ((size - child!.size) as Offset) / 2;
  }
}
