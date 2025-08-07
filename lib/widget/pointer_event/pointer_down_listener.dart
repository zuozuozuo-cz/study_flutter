import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

class PointerDownListener extends SingleChildRenderObjectWidget {
  final PointerDownEventListener? onPointerDown;

  PointerDownListener({Key? key, this.onPointerDown, Widget? child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPointerDownListener()..onPointerDown = onPointerDown;
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderPointerDownListener renderObject) {
    renderObject.onPointerDown = onPointerDown;
  }
}

class RenderPointerDownListener extends RenderProxyBox {
  PointerDownEventListener? onPointerDown;

  @override
  bool hitTestSelf(Offset position) {
    return true; // 始终通过命中测试
  }

  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry<HitTestTarget> entry) {
    // 事件分发时处理事件
    if(event is PointerDownEvent){
      onPointerDown?.call(event);
    }
  }
}
