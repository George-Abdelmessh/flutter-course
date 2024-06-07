import 'package:flutter/material.dart';
import 'package:note_app/core/app_helper/app_navigator.dart';
import 'package:note_app/core/constants/app_size.dart';
import 'package:note_app/core/custom_widgets/custom_text_button.dart';
import 'package:note_app/core/style/app_colors.dart';
import 'package:note_app/view/screens/login_screen.dart';

import 'register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthScale(context, 20),
            vertical: AppSize.heightScale(context, 35),
          ),
          child: Column(
            children: [
              Text(
                'Note App',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.textScale(context, 40),
                    color: AppColors.mineralGreen),
              ),
              SizedBox(
                height: AppSize.heightScale(context, 15),
              ),
              Icon(
                Icons.note_alt_outlined,
                color: AppColors.darkGrey,
                size: AppSize.widthScale(context, 100),
              ),
              const Spacer(),
              Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,',
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: AppSize.textScale(context, 12),
                ),
              ),
              SizedBox(
                height: AppSize.heightScale(context, 20),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      text: 'Login',
                      onTap: () => AppNavigator.push(
                        context,
                        const LoginScreen(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSize.widthScale(context, 10),
                  ),
                  Expanded(
                    child: CustomTextButton(
                      text: 'Registration',
                      onTap: () => AppNavigator.push(
                        context,
                        const RegisterScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
