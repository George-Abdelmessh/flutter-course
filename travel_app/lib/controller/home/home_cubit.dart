import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_state.dart';
import 'package:tarvel_app/core/storage/db_helper.dart';
import 'package:tarvel_app/core/storage/end_points.dart';
import 'package:tarvel_app/model/home/place_model.dart';
import 'package:tarvel_app/model/place_details/facility_model.dart';

import '../../model/home/category_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  int readMoreMaxLinesCount = 1;
  List<CategoryModel> categories = [];
  List<PlaceModel> places = [];
  List<PlaceModel> favPlaces = [];
  List<PlaceModel> popularPlaces = [];
  List<PlaceModel> recommendedPlaces = [];

  List<FacilityModel> allFacilities = [];
  late int selectedCategoryId = categories[0].id;

  void changeReadMoreMaxLines() {
    if (readMoreMaxLinesCount != 1) {
      readMoreMaxLinesCount = 1;
    } else {
      readMoreMaxLinesCount = 10;
    }
    emit(UpdateUiState());
  }

  void changeCategoryId(int id) {
    selectedCategoryId = id;
    if (id == -1) {
      popularPlaces = places;
    } else {
      popularPlaces = [];
      for (PlaceModel item in places) {
        if (item.catID == id) {
          popularPlaces.add(item);
        }
      }
    }
    emit(ChangeCategoryState());
  }

  Future<void> getAllData() async {
    await getFacilities();
    await getCategories();
    await getPlaces();
  }

  Future<void> getCategories() async {
    try {
      emit(LoadingGetDataState());
      categories = CategoryModel.formMapList(await DBHelper.select(
        sql: 'SELECT * FROM $CATEGOIRES_TABLE',
      ));
      categories.insert(0, const CategoryModel(id: -1, name: 'All'));
      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  Future<void> getPlaces() async {
    try {
      emit(LoadingGetDataState());
      places = PlaceModel.fromListMap(
        await DBHelper.select(
          sql: '''
          select p.*, group_concat(DISTINCT f.$ID | ",") as $FACILITIES
          from $PLACES_TABLE as p
          inner join $PLACE_FACILITES_TABLE pf on p.$ID = pf.$PLACE_ID
          inner join $FACILITiES_TABLE f on pf.$FACILITY_ID = f.$ID
          group by p.$ID
          ''',
        ),
      );

      /// 1, 2, 3
      for (PlaceModel item in places) {
        List<String> facilitiesIds = item.facilitiesIds.split(',');
        for (String id in facilitiesIds) {
          item.facilities.add(allFacilities
              .firstWhere((element) => element.id == int.tryParse(id)));
        }
        item.facilities.length;
      }

      dataHandler();
      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  void handleFavPlaces() {
    favPlaces.clear();
    for (PlaceModel item in places) {
      if (item.isFav == 1) {
        favPlaces.add(item);
      }
    }
    emit(UpdateUiState());
  }

  // SELECT
  // p.$ID AS PlaceID,
  // p.$NAME AS PlaceName,
  // p.$IMAGE AS PlaceImage,
  // p.$RATE AS PlaceRate,
  // p.$REVIWERS  AS PLaceReviewers,
  // p.$DESCRIPTION  AS PLaceDescription,
  // p.$LABEL  AS PLaceLabel,
  // p.$PRICE  AS PLacePrice,
  // p.$REASON  AS PLaceReason,
  // p.$CATEGORY_ID  AS CategoryId,
  // f.$FAS

  // SELECT
  // p.$ID,
  // p.$NAME,
  // p.$IMAGE,
  // p.$RATE,
  // p.$REVIWERS,
  // p.$DESCRIPTION,
  // p.$LABEL,
  // p.$PRICE,
  // p.$REASON,
  // p.$CATEGORY_ID,
  // f.$FACILITIES
  // FROM
  // $PLACES_TABLE AS p
  // LEFT JOIN (
  // SELECT
  // pf.$PLACE_ID,
  // GROUP_CONCAT(f.$NAME || ":" || f.$IMAGE, ",") AS Facilities
  // FROM
  // $PLACE_FACILITES_TABLE AS pf
  // JOIN
  // $FACILITiES_TABLE f ON pf.$FACILITY_ID = f.$ID
  // GROUP BY
  // pf.$PLACE_ID
  // ) f ON p.$ID = f.$PLACE_ID;
  // ''',
  //
  Future<void> getFacilities() async {
    try {
      emit(LoadingGetDataState());

      allFacilities = FacilityModel.fromListMap(
        await DBHelper.select(sql: 'SELECT * FROM $FACILITiES_TABLE'),
      );

      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  //
  // Future<void> getPlaceFacilities() async {
  //   try {
  //     emit(LoadingGetDataState());
  //
  //     placeFacilities = PlaceFacilitiesModel.fromListMap(
  //       await DBHelper.select(sql: 'SELECT * FROM $PLACE_FACILITES_TABLE'),
  //     );
  //
  //     emit(SuccessGetDataState());
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     emit(ErrorGetDataState());
  //   }
  // }

  // void handleFacilitiesDataList(int localPlaceId) {
  //   singlePlaceFacilities.clear();
  //   /// placeFacilities =>  id , placeId, facilityId
  //   /// singlePlaceFacilities =>  id , name, image
  //   for (PlaceFacilitiesModel item in placeFacilities) {
  //     if (item.placeId == localPlaceId) {
  //       singlePlaceFacilities.add(
  //         allFacilities.firstWhere((element) => element.id == item.facilityId),
  //       );
  //     }
  //   }
  //   emit(UpdateUiState());
  // }

  void dataHandler() {
    popularPlaces = places;
    recommendedPlaces = [];
    for (PlaceModel item in places) {
      if (item.label.isNotEmpty) {
        recommendedPlaces.add(item);
      }
    }
  }

  Future<void> toggleFav(int id, int currentValue) async {
    try {
      final int isFav = currentValue == 1 ? 0 : 1;
      await DBHelper.update(
        sql: 'UPDATE $PLACES_TABLE SET $IS_FAV = $isFav WHERE $ID = $id',
      );
      places.firstWhere((element) => element.id == id).isFav = isFav;
      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  Future<void> add() async {
    // await DBHelper.insert(sql:
    // '''
    // INSERT INTO $PLACE_FACILITES_TABLE ($PLACE_ID, $FACILITY_ID) VALUES (4, 1)
    // ''');
    // print(await DBHelper.select(sql: 'SELECT * FROM $PLACE_FACILITES_TABLE'));
    print('done');
  }

//
// List<PlaceModel> places = [
//   PlaceModel(
//     name: "Eiffel Tower",
//     image: "https://travel.usnews.com/images/New_Paris_pic_z3GdX0a.jpg",
//     rate: 4.8,
//     reviewers: 1200,
//     isFav: 1,
//     description:
//         "The Eiffel Tower is an iron lattice tower located in Paris, France.",
//     label: "",
//     reason: "",
//     prices: 20.0,
//     catID: 1,
//   ),
//   // PlaceModel(
//   //   name: "Grand Canyon",
//   //   image:
//   //       "https://www.nps.gov/grca/planyourvisit/images/mather-point-2021.jpg?maxwidth=1300&maxheight=1300&autorotate=false",
//   //   rate: 4.9,
//   //   reviewers: 1500,
//   //   isFav: 0,
//   //   description:
//   //       "The Grand Canyon is a steep-sided canyon carved by the Colorado River in Arizona, USA.",
//   //   label: "2N/3D",
//   //   reason: "Hot Deal",
//   //   prices: 30.0,
//   //   catID: 2,
//   // ),
//   // PlaceModel(
//   //   name: "Tokyo Tower",
//   //   image:
//   //       "https://travel.rakuten.com/contents/sites/contents/files/styles/max_1300x1300/public/2023-10/tokyo-tower-vs-tokyo-skytree_4.jpg?itok=YW4EnryU",
//   //   rate: 4.7,
//   //   reviewers: 1000,
//   //   isFav: 1,
//   //   description:
//   //       "Tokyo Tower is a communications tower located in Tokyo, Japan.",
//   //   label: "3N/3D",
//   //   reason: "Hot Deal",
//   //   prices: 25.0,
//   //   catID: 3,
//   // ),
//   // PlaceModel(
//   //   name: "Great Barrier Reef",
//   //   image:
//   //       "https://www.orpheus.com.au/wp-content/uploads/2019/08/shutterstock_269208791.jpg",
//   //   rate: 4.9,
//   //   reviewers: 1800,
//   //   isFav: 0,
//   //   description:
//   //       "The Great Barrier Reef is the world's largest coral reef system, located in Australia.",
//   //   label: "",
//   //   reason: "",
//   //   prices: 40.0,
//   //   catID: 4,
//   // ),
//   // PlaceModel(
//   //   name: "Acropolis of Athens",
//   //   image:
//   //       "https://www.artnews.com/wp-content/uploads/2023/08/GettyImages-1558046851.jpg?w=1024",
//   //   rate: 4.8,
//   //   reviewers: 1300,
//   //   isFav: 1,
//   //   description:
//   //       "The Acropolis of Athens is an ancient citadel located in Athens, Greece.",
//   //   label: "1N/2D",
//   //   reason: "Hot Deal",
//   //   prices: 20.0,
//   //   catID: 1,
//   // ),
// ];

// Future<void> addData() async {
//   for (PlaceModel item in places) {
//
//     try {
//       await DBHelper.insert(
//         sql: '''
//     INSERT INTO $PLACES_TABLE (
//     $NAME,
//     $IMAGE,
//     $RATE,
//     $REVIWERS,
//     $IS_FAV,
//     $DESCRIPTION,
//     $LABEL,
//     $PRICE,
//     $REASON,
//     $CATEGORY_ID
//     ) VALUES (
//     "Tokyo Tower",
//     "https://travel.rakuten.com/contents/sites/contents/files/styles/max_1300x1300/public/2023-10/tokyo-tower-vs-tokyo-skytree_4.jpg?itok=YW4EnryU",
//     4.5,
//     1000,
//     0,
//     "Tokyo Tower is a communications tower located in Tokyo, Japan.",
//     "4N/3D",
//    25.0,
//     "Hot Deal",
//     3
//     )''',
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
//   print('Done');
// }

// Future<void> addCat() async {
//   await DBHelper.insert(sql: 'INSERT INTO $CATEGOIRES_TABLE ($NAME) VALUES ("Adventure")');
//   print('Done');
// }
}
