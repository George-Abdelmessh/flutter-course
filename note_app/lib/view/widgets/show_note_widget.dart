import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/widgets/icon_text_widget.dart';

import '../../core/constants/app_size.dart';
import '../../core/style/app_colors.dart';

class ShowNoteWidget extends StatelessWidget {
  const ShowNoteWidget({super.key, required this.data});

  final NoteModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: AppSize.widthScale(context, 18),
              color: AppColors.darkGrey,
            )),
        SizedBox(height: AppSize.heightScale(context, 10)),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            data.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSize.textScale(context, 20),
              color: AppColors.mineralGreen,
            ),
          ),
        ),
        SizedBox(height: AppSize.heightScale(context, 10)),
        IconTextWidget(
          icon: Icons.access_time,
          text: data.dateTime,
          style: TextStyle(
              fontSize: AppSize.textScale(context, 10),
              color: AppColors.darkGrey),
        ),
        SizedBox(height: AppSize.heightScale(context, 10)),
        IconTextWidget(
          icon: Icons.description,
          text: data.description,
          style: TextStyle(
            fontSize: AppSize.textScale(context, 14),
            fontWeight: FontWeight.bold,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
