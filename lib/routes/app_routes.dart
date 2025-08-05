class AppRoutes {
  /// 根
  static const root = '/';

  /// 首页路由
  static const base = '${root}base';
  static const base_study = '${base}study';
  static const source_study = '${base}source';
  static const scroll_study = '${base}scroll';
  static const complex_demo = '${base}complex';
  static const getx_study = '${base}getx';

  /// 基本学习demo
  static const stateless = '/stateless';
  static const contextDemo = '/context';
  static const lifecycle = '/life';
  static const constraints = '/constraints';

  /// 滑动学习demo
  static const scrollController = '/scrollcontroller';
  static const keepOffset = '/keepoffset';
  static const tablet = '/tablet';
  static const keepAlive = '/keepalive';
  static const customScroll = '/customscroll';

  /// 综合Demo 页面
  static const demo = '/demo';
  static const demoSnh = '$demo/snh';

  /// 关于原理理解的demo
  static const understanding = '/understanding';
  static const element = '$understanding/element';
  static const frame = '$understanding/frame';
  static const layout = '$understanding/layout';
  static const painting = '$understanding/paint';
  static const compositing = '$understanding/compositing';
  static const pointer_event = '$understanding/pointer_event';
}
