import 'package:flutter/material.dart';
import 'package:tarvel_app/core/style/app_colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key, required this.hint, this.prefix});

  final String hint;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        prefixIcon: prefix,
        hintStyle: TextStyle(color: AppColors.darkGrey.withOpacity(0.8)),
        fillColor: AppColors.lightGrey,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
