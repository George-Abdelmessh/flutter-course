import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controller/notes/notes_states.dart';
import 'package:note_app/core/storage/cache_manager.dart';
import 'package:note_app/core/storage/db_helper.dart';
import 'package:note_app/core/storage/end_points.dart';
import 'package:note_app/model/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitState());

  static NotesCubit get(BuildContext context) => BlocProvider.of(context);

  List<NoteModel> notes = [];

  Future<void> addNote(String title, String description) async {
    try {
      emit(LoadingState());
      final String now = DateTime.now().toString();
      final int id = CacheManager.getDate(key: 'id');

      await DBHelper.insert(
        sql: '''
        INSERT INTO $NOTES_TABLE (
          $NAME, 
          $NOTE, 
          $DATE_TIME, 
          $USER_ID)
        VALUES (
          "$title",
          "$description",
          "$now",
          $id)
      ''',
      );

      await getNotes();
      emit(SuccessAddDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
    }
  }

  Future<void> getNotes() async {
    try {
      emit(LoadingState());
      final int id = CacheManager.getDate(key: 'id');

      notes = NoteModel.formList(
        await DBHelper.select(
          sql: 'SELECT * FROM $NOTES_TABLE WHERE $USER_ID = $id',
        ),
      );
      emit(SuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
    }
  }

  Future<void> deleteNote(int noteId) async {
    try {
      emit(LoadingState());

      await DBHelper.delete(
        sql: 'DELETE FROM $NOTES_TABLE WHERE $ID = $noteId',
      );

      await getNotes();
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
    }
  }
}
