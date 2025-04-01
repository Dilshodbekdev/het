import 'package:reactive_forms/reactive_forms.dart';

class EmailOrPhoneValidator extends Validator<dynamic> {
  const EmailOrPhoneValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value as String?;
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty case
    }

    // Regex for email
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

    // Regex for Uzbek phone numbers (e.g., +998901234567)
    final uzbekPhoneRegex = RegExp(r'^\+998\d{9}$');

    if (emailRegex.hasMatch(value) || uzbekPhoneRegex.hasMatch(value)) {
      return null; // Valid input
    }

    return {'invalid': true}; // Invalid i
  }
}