import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controller/auth/auth_cubit.dart';
import 'package:note_app/controller/auth/auth_states.dart';
import 'package:note_app/core/app_helper/app_navigator.dart';
import 'package:note_app/core/app_helper/app_validators.dart';
import 'package:note_app/core/custom_widgets/custom_text_form_field.dart';

import '../../core/constants/app_size.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/style/app_colors.dart';
import 'notes_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    userName.dispose();
    password.dispose();
  }

  void onTap() {
    if (_key.currentState!.validate()) {
      AuthCubit.get(context).login(
        user: userName.text,
        password: password.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is SuccessState) {
              AppNavigator.pushRemove(context, const NotesScreen());
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthScale(context, 20),
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.textScale(context, 30),
                          color: AppColors.mineralGreen,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 15),
                      ),
                      Icon(
                        Icons.verified_user_outlined,
                        color: AppColors.darkGrey,
                        size: AppSize.widthScale(context, 100),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 40),
                      ),
                      CustomTextFormField(
                        hint: 'UserName',
                        controller: userName,
                        validator: (val) => AppValidators.required(value: val),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 8),
                      ),
                      CustomTextFormField(
                        hint: 'Password',
                        controller: password,
                        validator: (val) => AppValidators.required(value: val),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 15),
                      ),
                      CustomTextButton(
                        text: 'Login',
                        onTap: () => onTap(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
