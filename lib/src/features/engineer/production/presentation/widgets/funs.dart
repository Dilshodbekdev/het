import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/theme/app_colors.dart';

String getTaskType(String type, BuildContext context) {
  return (() {
    switch (type) {
      case '1':
        return S.of(context).capitalRepair;
      case '2':
        return S.of(context).currentRepair;
      case '3':
        return S.of(context).bypass;
      case '4':
        return S.of(context).defectiveAct;
      case '5':
        return S.of(context).emergencyRepair;
      default:
        return '-';
    }
  }());
}

Color getColor(String status) {
  return (() {
    switch (status) {
      case '2':
        return Colors.grey;
      case '3':
        return AppColors.mainYellowColor;
      case '4':
        return Colors.blueAccent;
      case '5':
        return AppColors.mainGreenColor;
      case '6':
        return AppColors.mainRedColor;
      default:
        return Colors.grey;
    }
  }());
}

String getTitle(String status,BuildContext context) {
  return (() {
    switch (status) {
      case '2':
        return S.of(context).new1;
      case '3':
        return S.of(context).inProccess;
      case '4':
        return S.of(context).awaitingConfirmation;
      case '5':
        return S.of(context).complated;
      case '6':
        return S.of(context).rejected;
      default:
        return '-';
    }
  }());
}