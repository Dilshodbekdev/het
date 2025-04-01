import 'package:flutter/material.dart';
import 'package:het/src/config/theme/app_colors.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? wight;
  final double? radius;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const AppContainer({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.height,
    this.wight,
    this.radius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(8),
      padding: padding ?? const EdgeInsets.all(12),
      height: height,
      width: wight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12),
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
