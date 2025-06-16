import 'package:flutter/cupertino.dart';

class DeviceTypeWidget extends StatefulWidget {
  final Widget phone;
  final Widget tablet;

  /// 是否平板横屏（默认 false）
  final bool forceTabletLandscape;

  final bool Function(BuildContext context)? isTabletOverride;

  const DeviceTypeWidget(
      {super.key,
      required this.phone,
      required this.tablet,
      this.forceTabletLandscape = false,
      this.isTabletOverride});

  @override
  State<DeviceTypeWidget> createState() => _DeviceTypeWidgetState();
}

class _DeviceTypeWidgetState extends State<DeviceTypeWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isTablet = widget.isTabletOverride?.call(context) ??
        MediaQuery.of(context).size.shortestSide >= 600;

    return isTablet ? widget.tablet : widget.phone;
  }
}
