import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_cubit.dart';
import 'package:tarvel_app/controller/home/home_state.dart';
import 'package:tarvel_app/view/cards/recommended_card.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return RecommendedCard(
              placeData: HomeCubit.get(context).recommendedPlaces[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 28);
          },
          itemCount: HomeCubit.get(context).recommendedPlaces.length,
        );
      },
    );
  }
}
