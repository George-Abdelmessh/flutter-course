import 'package:flutter/material.dart';
import 'package:tarvel_app/core/constants/app_images.dart';
import 'package:tarvel_app/core/style/app_colors.dart';
import 'package:tarvel_app/model/home/place_model.dart';

import '../../core/app_helper/app_navigator.dart';
import '../screens/place_details_screen.dart';
import '../widgets/custom_icon_with_text.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({super.key, required this.placeData});

  final PlaceModel placeData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(
        context,
        PlaceDetailsScreen(placeData: placeData),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGrey.withOpacity(0.1),
              offset: const Offset(0, 3),
              blurRadius: 0.2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 102,
              child: Stack(
                children: [
                  Container(
                    width: 166,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        image: DecorationImage(
                            image: NetworkImage(placeData.image),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9)),
                        border: Border.all(color: AppColors.white, width: 2),
                        color: AppColors.mineralGreen,
                      ),
                      child: Text(
                        placeData.label,
                        style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              placeData.name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            CustomIconWithText(
              icon: Image.asset(AppImages.arrow),
              text: placeData.reason,
            ),
          ],
        ),
      ),
    );
  }
}
