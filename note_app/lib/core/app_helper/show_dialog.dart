import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_size.dart';
import 'package:note_app/core/style/app_colors.dart';

void showPopupDialog(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: Padding(
          padding: EdgeInsets.all(AppSize.widthScale(context, 15)),
          child: widget,
        ),
      );
    },
  );
}
