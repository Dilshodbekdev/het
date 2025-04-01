import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/theme/app_colors.dart';

Color getGarageApplicationStatusColor(String status) {
  return (() {
    switch (status) {
      case '2':
        return Colors.grey;
      case '4':
        return AppColors.mainYellowColor;
      case '5':
        return AppColors.mainGreenColor;
      default:
        return Colors.grey;
    }
  }());
}

String getGarageApplicationStatusTitle(String status,BuildContext context) {
  return (() {
    switch (status) {
      case '2':
        return S.of(context).new1;
      case '4':
        return S.of(context).inProccess;
      case '5':
        return S.of(context).complated;
      default:
        return '-';
    }
  }());
}