import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controller/notes/notes_cubit.dart';
import 'package:note_app/controller/notes/notes_states.dart';

import '../../core/app_helper/app_validators.dart';
import '../../core/constants/app_size.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/custom_widgets/custom_text_form_field.dart';
import '../../core/style/app_colors.dart';

class AddNoteWidget extends StatefulWidget {
  const AddNoteWidget({super.key});

  @override
  State<AddNoteWidget> createState() => _AddNoteWidgetState();
}

class _AddNoteWidgetState extends State<AddNoteWidget> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void onTap() {
    if (_key.currentState!.validate()) {
      NotesCubit.get(context).addNote(title.text, description.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSize.widthScale(context, 20),
          left: AppSize.widthScale(context, 20),
          top: AppSize.widthScale(context, 20),
          bottom: MediaQuery.of(context).viewInsets.bottom +
              AppSize.widthScale(context, 20),
        ),
        // padding: EdgeInsets.all(AppSize.widthScale(context, 20)),
        child: BlocConsumer<NotesCubit, NotesStates>(
          listener: (context, state) {
            if (state is SuccessAddDataState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add Note',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.textScale(context, 20),
                      color: AppColors.mineralGreen,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.heightScale(context, 15),
                  ),
                  CustomTextFormField(
                    hint: 'Title',
                    controller: title,
                    validator: (val) => AppValidators.required(value: val),
                  ),
                  SizedBox(
                    height: AppSize.heightScale(context, 8),
                  ),
                  CustomTextFormField(
                    hint: 'Note Description',
                    controller: description,
                    minLines: 3,
                    maxLines: 3,
                    textInputType: TextInputType.multiline,
                    validator: (val) => AppValidators.required(value: val),
                  ),
                  SizedBox(
                    height: AppSize.heightScale(context, 15),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: 'Add',
                          onTap: () => onTap(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
