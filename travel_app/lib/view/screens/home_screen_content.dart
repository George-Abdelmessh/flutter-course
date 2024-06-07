import 'package:flutter/material.dart';
import 'package:tarvel_app/view/widgets/custom_icon_with_text.dart';

import '../../core/constants/app_images.dart';
import '../../core/style/app_colors.dart';
import '../widgets/cateories_widget.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/popular_palces_widget.dart';
import '../widgets/recommended_widget.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                CustomIconWithText(
                  icon: Image.asset(AppImages.location),
                  text: 'Aspen, USA',
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGrey,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.blue,
                ),
              ],
            ),
            const Text(
              'Aspen',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomInputField(
              hint: 'Find things to do',
              prefix: Icon(
                Icons.search,
                color: AppColors.darkGrey.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(height: 50, child: CategoriesWidget()),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  'Popular',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(height: 240, child: PopularPlacesWidget()),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Recommended',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(height: 150, child: RecommendedWidget()),
          ],
        ),
      ),
    );
  }
}
