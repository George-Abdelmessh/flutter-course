import 'package:flutter/material.dart';
import 'package:tarvel_app/core/style/app_colors.dart';

import '../../model/place_details/facility_model.dart';

class FacilitiesCard extends StatelessWidget {
  const FacilitiesCard({super.key, required this.data});

  final FacilityModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 77,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: AppColors.lightGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            data.image,
            errorBuilder: (context, error, _) {
              return Icon(
                Icons.error_outline,
                color: AppColors.darkGrey.withOpacity(0.8),
              );
            },
          ),
          Text(
            data.name,
            style: TextStyle(
              fontSize: 10,
              color: AppColors.darkGrey.withOpacity(0.8),
            ),
          )
        ],
      ),
    );
  }
}
