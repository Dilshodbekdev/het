import 'package:flutter/material.dart';

OutlineInputBorder appReferenceTextFiledBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.transparent),
  );
}

OutlineInputBorder appReferenceTextFiledErrorBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.red),
  );
}
