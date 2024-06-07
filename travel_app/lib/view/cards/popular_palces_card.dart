import 'package:flutter/material.dart';
import 'package:tarvel_app/controller/home/home_cubit.dart';
import 'package:tarvel_app/core/app_helper/app_navigator.dart';
import 'package:tarvel_app/core/style/app_colors.dart';
import 'package:tarvel_app/model/home/place_model.dart';
import 'package:tarvel_app/view/screens/place_details_screen.dart';

import '../widgets/custom_icon_with_text.dart';
import '../widgets/fav_button_widget.dart';

class PopularPlacesCard extends StatelessWidget {
  const PopularPlacesCard({super.key, required this.placeData});

  final PlaceModel placeData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(
        context,
        PlaceDetailsScreen(placeData: placeData,),
      ),
      child: Container(
        width: 188,
        height: 240,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          image: DecorationImage(
              image: NetworkImage(placeData.image), fit: BoxFit.cover),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: AppColors.darkGrey,
                  ),
                  child: Text(
                    placeData.name,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: AppColors.darkGrey,
                  ),
                  child: CustomIconWithText(
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 16,
                    ),
                    text: placeData.rate.toString(),
                    textStyle:
                        const TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const Spacer(),
            FavButtonWidget(
              onTap: () => HomeCubit.get(context).toggleFav(
                placeData.id,
                placeData.isFav,
              ),
              isFav: placeData.isFav == 1,
              // isFav: placeData.isFav == 1? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
