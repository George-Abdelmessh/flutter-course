import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_cubit.dart';
import 'package:tarvel_app/controller/home/home_state.dart';

import '../cards/popular_palces_card.dart';

class PopularPlacesWidget extends StatelessWidget {
  const PopularPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PopularPlacesCard(
              placeData: HomeCubit.get(context).popularPlaces[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 28,
            );
          },
          itemCount: HomeCubit.get(context).popularPlaces.length,
        );
      },
    );
  }
}
