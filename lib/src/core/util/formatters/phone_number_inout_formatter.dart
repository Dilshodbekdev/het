import 'package:flutter/services.dart';

class PhoneNumberInoutFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only digits and starting with '+998'
    if (newValue.text.isEmpty) {
      return TextEditingValue.empty;
    }

    final StringBuffer newText = StringBuffer();
    String formattedNumber = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the number starts with +998
    if (formattedNumber.startsWith('998')) {
      formattedNumber = formattedNumber.substring(3); // Remove '998'
      newText.write('+998 ');
    } else if (formattedNumber.startsWith('9')) {
      newText.write('+998 ');
    } else if (formattedNumber.startsWith('98')) {
      newText.write('+998 ');
      formattedNumber = formattedNumber.substring(2); // Remove '98'
    }

    // Format the rest of the number
    for (int i = 0; i < formattedNumber.length; i++) {
      if (i == 0) {
        newText.write(formattedNumber[i]); // First digit
      } else if (i == 2 || i == 5) {
        newText.write(' '); // Space after 2nd and 5th digits
        newText.write(formattedNumber[i]);
      } else {
        newText.write(formattedNumber[i]);
      }
    }

    // Return the formatted number
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
