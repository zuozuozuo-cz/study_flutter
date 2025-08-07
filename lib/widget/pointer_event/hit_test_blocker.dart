import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class HitTestBlocker extends SingleChildRenderObjectWidget {
  final bool up;

  /// up = true 时，hitTest 将会一直返回false
  final bool down;

  /// down = true 时，hitTest 将不会调用 hitTestChildren
  final bool self;

  HitTestBlocker({this.up = true, this.down = false, this.self = false, Key? key, Widget? child}) : super(key: key, child: child);

  /// hitSelf 的返回值

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderHitTestBlocker(up: up, down: down, self: self);
  }

  @override
  void updateRenderObject(BuildContext context, RenderHitTestBlocker renderObject) {
    renderObject
      ..up = up
      ..down = down
      ..self = self;
  }
}

class RenderHitTestBlocker extends RenderProxyBox {
  bool up;
  bool down;
  bool self;

  RenderHitTestBlocker({this.up = true, this.down = true, this.self = true});

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    bool hitTestDownResult = false;
    if (!down) {
      hitTestDownResult = hitTestChildren(result, position: position);
    }

    bool pass = hitTestSelf(position) || (hitTestDownResult && size.contains(position));

    if (pass) {
      result.add(BoxHitTestEntry(this, position));
    }

    return !up && pass;
  }

  @override
  bool hitTestSelf(Offset position) => self;
}
