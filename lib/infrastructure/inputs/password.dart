import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return PasswordInputError.empty;
    } else if (value.length < 6) {
      return PasswordInputError.length;
    }

    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    switch (displayError) {
      case PasswordInputError.empty:
        return 'La constraseña es requerida';
      case PasswordInputError.length:
        return 'Require al menos 6 caracteres';
      default:
        return null;
    }
  }
}
