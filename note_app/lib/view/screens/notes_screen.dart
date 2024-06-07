import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/controller/notes/notes_cubit.dart';
import 'package:note_app/core/app_helper/app_navigator.dart';
import 'package:note_app/core/constants/app_size.dart';
import 'package:note_app/core/storage/cache_manager.dart';
import 'package:note_app/core/style/app_colors.dart';
import 'package:note_app/view/screens/home_screen.dart';
import 'package:note_app/view/widgets/add_note_widget.dart';
import 'package:note_app/view/widgets/notes_widget.dart';

import '../../core/app_helper/show_bottom_sheet.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    super.initState();
    NotesCubit.get(context).getNotes();
  }

  void logout() {
    CacheManager.removeData(key: 'id');
    CacheManager.removeData(key: 'name');
    AppNavigator.pushRemove(context, const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        centerTitle: true,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showCustomBottomSheet(
              context,
              const AddNoteWidget(),
            ),
            icon: const Icon(
              Icons.note_add_outlined,
              color: AppColors.white,
            ),
          ),
          IconButton(
            onPressed: () => logout(),
            icon: const Icon(
              Icons.logout,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthScale(context, 15),
            vertical: AppSize.widthScale(context, 10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${CacheManager.getDate(key: 'name').toString().toUpperCase()} 👋",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppSize.heightScale(context, 10)),
              const Expanded(child: NotesWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
