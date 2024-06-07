import 'package:tarvel_app/core/storage/end_points.dart';
import 'package:tarvel_app/model/place_details/facility_model.dart';

class PlaceModel {
  final int id;
  final String name;
  final String image;
  final double rate;
  final int reviewers;
  int isFav;
  final String description;
  final String label;
  final String reason;
  final double prices;
  final int catID;
  final String facilitiesIds;
  List<FacilityModel> facilities;

  PlaceModel({
    required this.id,
    required this.image,
    required this.name,
    required this.isFav,
    required this.rate,
    required this.reason,
    required this.label,
    required this.description,
    required this.prices,
    required this.reviewers,
    required this.catID,
    required this.facilitiesIds,
    required this.facilities,
  });

  factory PlaceModel.fromMap(Map<String, dynamic> data) => PlaceModel(
        id: data[ID],
        image: data[IMAGE],
        name: data[NAME],
        isFav: data[IS_FAV],
        rate: data[RATE],
        reason: data[REASON],
        label: data[LABEL],
        description: data[DESCRIPTION],
        prices: data[PRICE],
        reviewers: data[REVIWERS],
        catID: data[CATEGORY_ID],
        facilitiesIds: data[FACILITIES],
        facilities: [],
      );

  static List<PlaceModel> fromListMap(List<Map<String, dynamic>> data) {
    return data.map((item) => PlaceModel.fromMap(item)).toList();
  }
}
