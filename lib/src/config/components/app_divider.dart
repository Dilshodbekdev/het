import 'package:flutter/material.dart';
import 'package:het/src/config/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  const AppDivider({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height!=null?32:1,
      color: AppColors.borderColor,
    );
  }
}
