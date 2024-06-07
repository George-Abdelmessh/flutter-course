import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_cubit.dart';
import 'package:tarvel_app/controller/home/home_state.dart';
import 'package:tarvel_app/core/style/app_colors.dart';

import '../cards/category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is LoadingGetDataState) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.blue,
          ));
        }
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryData: HomeCubit.get(context).categories[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: HomeCubit.get(context).categories.length,
        );
      },
    );
  }
}
