import 'package:flutter/material.dart';

import '../../core/constants/app_size.dart';
import '../../core/style/app_colors.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.text,
    this.style,
    this.maxLines,
  });

  final IconData icon;
  final int? maxLines;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.darkGrey.withOpacity(0.8),
          size: AppSize.widthScale(context, 16),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: style ??
                TextStyle(
                  fontSize: AppSize.textScale(context, 16),
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
            maxLines: maxLines,
          ),
        )
      ],
    );
  }
}
