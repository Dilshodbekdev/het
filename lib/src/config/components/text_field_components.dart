import 'package:flutter/material.dart';
import 'package:het/src/config/theme/app_colors.dart';

OutlineInputBorder appTextFiledBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: AppColors.borderColor),
  );
}

OutlineInputBorder appTextFiledErrorBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(color: Colors.red),
  );
}

OutlineInputBorder appTextFiledTransparentBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );
}
