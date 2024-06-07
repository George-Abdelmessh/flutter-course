import 'package:note_app/core/storage/end_points.dart';

class NoteModel {
  final int id;
  final String title;
  final String description;
  final String dateTime;

  const NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  factory NoteModel.formMap(Map<String, dynamic> data) => NoteModel(
        id: data[ID],
        title: data[NAME],
        description: data[NOTE],
        dateTime: data[DATE_TIME],
      );

  static List<NoteModel> formList(List<Map<String, dynamic>> data) {
    return data.map((item) => NoteModel.formMap(item)).toList();
  }
}
