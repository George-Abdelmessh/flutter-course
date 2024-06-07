import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/controller/notes/notes_cubit.dart';
import 'package:note_app/core/app_helper/show_dialog.dart';
import 'package:note_app/core/constants/app_size.dart';
import 'package:note_app/core/style/app_colors.dart';
import 'package:note_app/model/note_model.dart';

import '../widgets/icon_text_widget.dart';
import '../widgets/show_note_widget.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.data});

  final NoteModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.widthScale(context, 12)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
              color: AppColors.darkGrey.withOpacity(0.3),
              offset: const Offset(0, 0),
              blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTextWidget(
                  icon: Icons.title,
                  text: data.title,
                ),
                const SizedBox(height: 8),
                IconTextWidget(
                  icon: Icons.description,
                  text: data.description,
                  maxLines: 1,
                  style: const TextStyle(
                      color: AppColors.darkGrey,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => showPopupDialog(
              context,
              ShowNoteWidget(data: data),
            ),
            child: Icon(
              Icons.info_outline_rounded,
              color: AppColors.blue,
              size: AppSize.widthScale(context, 20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => NotesCubit.get(context).deleteNote(data.id),
            child: Icon(
              Icons.delete_forever_outlined,
              color: Colors.red,
              size: AppSize.widthScale(context, 20),
            ),
          ),
        ],
      ),
    );
  }
}
