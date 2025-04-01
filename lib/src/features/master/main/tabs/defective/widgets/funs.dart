import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/theme/app_colors.dart';

Color getDefectiveActColor(String status) {
  return (() {
    switch (status) {
      case '2'||'1':
        return AppColors.mainYellowColor;
      case '3'||'7':
        return AppColors.mainRedColor;
      case '6':
        return AppColors.mainGreenColor;
      case '':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }());
}

String getDefectiveActTitle(String status, BuildContext context) {
  return (() {
    switch (status) {
      case '2' || '1':
        return S.of(context).awaitingConfirmation;
      case '3'||'7':
        return S.of(context).rejected;
      case '6':
        return S.of(context).approved;
      case '':
        return S.of(context).draft;
      default:
        return '-';
    }
  }());
}
