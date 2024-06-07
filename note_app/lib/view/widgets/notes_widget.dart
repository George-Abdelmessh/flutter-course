import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controller/notes/notes_cubit.dart';
import 'package:note_app/controller/notes/notes_states.dart';
import 'package:note_app/core/constants/app_images.dart';
import 'package:note_app/core/constants/app_size.dart';
import 'package:note_app/core/style/app_colors.dart';
import 'package:note_app/view/cards/note_card.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesCubit cubit = NotesCubit.get(context);
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        if (cubit.notes.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.emptyImage,
              ),
              const Text(
                'There are no notes,\nplease press + to add a note',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              )
            ],
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return NoteCard(
              data: cubit.notes[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: AppSize.heightScale(context, 10));
          },
          itemCount: cubit.notes.length,
        );
      },
    );
  }
}
