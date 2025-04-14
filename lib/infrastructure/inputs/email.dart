import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EmailError.empty;
    } else if (!emailRegExp.hasMatch(value)) {
      return EmailError.format;
    }

    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    switch (displayError) {
      case EmailError.empty:
        return 'El email es requerido';
      case EmailError.format:
        return 'No tienes un formato de email correcto';
      default:
        return null;
    }
  }
}
