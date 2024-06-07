import 'package:flutter/material.dart';
import 'package:tarvel_app/core/style/app_colors.dart';

class FavButtonWidget extends StatelessWidget {
  const FavButtonWidget({
    super.key,
    this.width = 30,
    this.height = 30,
    this.iconSize = 18,
    required this.isFav,
    required this.onTap,
  });

  final double width;
  final double height;
  final double iconSize;
  final bool isFav;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff0038FF).withOpacity(0.4),
                  offset: const Offset(0, 6),
                  blurRadius: 19,
                  spreadRadius: 0)
            ]),
        child: Center(
          child: Icon(
            Icons.favorite,
            color: isFav ? Colors.red : AppColors.darkGrey,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
