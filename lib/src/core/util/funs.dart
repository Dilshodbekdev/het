import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/util/app_constants.dart';
import 'package:intl/intl.dart';

String convertDateTime(String? date) {
  var outputDate = "";
  if (date != null) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm');
    outputDate = outputFormat.format(inputDate);
  }
  return outputDate;
}

String getCurrencySymbol(double value) {
  String valueString = value.toStringAsFixed(0);
  String pattern = r'(\d)(?=(\d{3})+(?!\d))';
  RegExp regex = RegExp(pattern);
  String formattedValue = valueString.replaceAllMapped(
      regex, (Match match) => '${match.group(1)} ');
  return '$formattedValue so\'m';
}

Future<String> fetchImageUrl(String url) async {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrlServer,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible,
    ),
  );

  final response = await dio.get(url);

  if (response.statusCode == 200) {
    // Parse the response to get the image URL
    final imageUrl =
        response.data['imageUrl']; // Adjust this according to your API response
    return imageUrl;
  } else {
    throw Exception('Failed to load image');
  }
}

DataColumn appDataColumn(String text) {
  return DataColumn(
    label: Expanded(
      child: Text(
        text,
        style: CustomTextStyle.h14SB,
      ),
    ),
  );
}