import 'package:flutter/material.dart';
import 'package:tarvel_app/core/style/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.blue,
      onPressed: onTap,
      minWidth: double.infinity,
      height: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: child,
    );
  }
}
