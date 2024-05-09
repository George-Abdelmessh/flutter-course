import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.secureText = false,
    this.borderColor = Colors.deepPurple,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.isFilled,
    this.validator,
  });

  final String hint;
  final TextEditingController? controller;
  final bool secureText;
  final Color borderColor;
  final Color? fillColor;
  final bool? isFilled;
  final Widget? prefix;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ?? (val) => null,
      obscureText: secureText,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: isFilled,
        // label: Icon(Icons.access_alarms),
        // labelText: 'UserName',
        prefixIcon: prefix,
        prefixIconColor: Colors.grey,
        suffixIcon: suffix,
        // prefixIconConstraints: BoxConstraints(
        //   maxHeight: 30,
        //   minWidth: 120
        // ),

        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),

          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        //---------
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
