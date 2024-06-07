import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tarvel_app/core/app_helper/app_navigator.dart';
import 'package:tarvel_app/core/constants/app_images.dart';
import 'package:tarvel_app/core/constants/app_size.dart';
import 'package:tarvel_app/core/style/app_colors.dart';
import 'package:tarvel_app/view/screens/home_screen.dart';

import '../widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.startBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 48,
                top: 93,
                right: 55,
                left: 55,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Aspen',
                        style: TextStyle(
                          color: AppColors.white,
                          // fontWeight: FontWeight.w600,
                          fontFamily: 'Hiatus',
                          fontSize: AppSize.textScale(context, 116),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Plan your',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppColors.white.withOpacity(0.8),
                        fontSize: AppSize.textScale(context, 24),
                      ),
                    ),
                    Text(
                      'Luxurious\nVacation',
                      style: TextStyle(
                        color: AppColors.white,
                        height: 1,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.textScale(context, 40),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.heightScale(context, 24),
                    ),
                    CustomButton(
                      onTap: () =>
                          AppNavigator.push(context, const HomeScreen()),
                      child: const Text(
                        'Explore',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
