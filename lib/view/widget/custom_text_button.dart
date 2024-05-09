import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.bgColor = Colors.deepPurple,
    required this.onTap,
    this.radius = 30,
  });

  final String text;
  final Color bgColor;
  final Function() onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      // minWidth: double.infinity,
      color: bgColor,
      textColor: Colors.white,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
