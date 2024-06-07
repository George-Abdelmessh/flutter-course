import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_cubit.dart';
import 'package:tarvel_app/controller/home/home_state.dart';
import 'package:tarvel_app/core/style/app_colors.dart';
import 'package:tarvel_app/view/cards/popular_palces_card.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
    cubit.handleFavPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Center(
        child: Column(
          children: [
            const Text(
              'Fav Screen',
              style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return PopularPlacesCard(placeData: cubit.favPlaces[index]);
                    },
                    itemCount: cubit.favPlaces.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
