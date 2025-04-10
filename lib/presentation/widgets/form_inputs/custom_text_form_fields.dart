import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final Icon icon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscure;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hint,
    this.icon = const Icon(Icons.search_rounded),
    this.errorText,
    this.onChanged,
    this.validator,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.primary, width: 1),
    );

    return TextFormField(
      decoration: InputDecoration(
        label:
            label != null
                ? Text(label!)
                : null, // Cambiado a label: label != null ? Text(label!) : null,
        hintText: hint,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        isDense: true,
        focusColor: colors.primary,
        prefixIcon: icon,
        errorText: errorText,
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      obscureText: obscure,
    );
  }
}
