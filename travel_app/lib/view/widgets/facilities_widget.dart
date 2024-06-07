import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_cubit.dart';
import 'package:tarvel_app/controller/home/home_state.dart';
import 'package:tarvel_app/model/place_details/facility_model.dart';
import 'package:tarvel_app/view/cards/facilities_card.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key, required this.facilities});

  final List<FacilityModel> facilities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FacilitiesCard(
              data: facilities[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 14,
            );
          },
          itemCount: facilities.length,
        );
      },
    );
  }
}
