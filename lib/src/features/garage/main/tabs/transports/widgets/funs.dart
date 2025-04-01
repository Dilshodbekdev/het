import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/theme/app_colors.dart';

Color getGarageTransportStatusColor(String status) {
  return (() {
    switch (status) {
      case '1':
        return AppColors.mainGreenColor;
      case '2':
        return AppColors.mainYellowColor;
      case '3':
        return AppColors.mainRedColor;
      default:
        return Colors.grey;
    }
  }());
}

String getGarageTransportStatusTitle(String status,BuildContext context) {
  return (() {
    switch (status) {
      case '1':
        return S.of(context).free;
      case '2':
        return S.of(context).borrow;
      case '3':
        return S.of(context).repair;
      default:
        return '-';
    }
  }());
}