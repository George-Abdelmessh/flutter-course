import 'package:tarvel_app/core/storage/end_points.dart';

class CategoryModel {
  final int id;
  final String name;

  const CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> data) => CategoryModel(
        id: data[ID],
        name: data[NAME],
      );

  /// [
  ///   {"id":1, "name": "Food1"},
  ///   {"id":2, "name": "Food2"},
  ///   {"id":3, "name": "Food3"},
  ///   {"id":4, "name": "Food4"},
  /// ]
  ///
  /// [
  /// CategoryModel(id: 1, name: "Food1"),
  /// CategoryModel(id: 1, name: "Food1"),
  /// CategoryModel(id: 1, name: "Food1"),
  /// CategoryModel(id: 1, name: "Food1"),
  /// ]

  static List<CategoryModel> formMapList(List<Map<String, dynamic>> data) {
    return data.map((item) => CategoryModel.fromMap(item)).toList();
  }
}