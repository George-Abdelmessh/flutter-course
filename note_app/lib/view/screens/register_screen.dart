import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controller/auth/auth_cubit.dart';
import 'package:note_app/controller/auth/auth_states.dart';
import 'package:note_app/core/app_helper/app_navigator.dart';
import 'package:note_app/core/app_helper/app_validators.dart';
import 'package:note_app/core/custom_widgets/custom_text_form_field.dart';
import 'package:note_app/view/screens/home_screen.dart';

import '../../core/constants/app_size.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/style/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    userName.dispose();
    password.dispose();
  }

  Future<void> onTap() async {
    if (key.currentState!.validate()) {
      final bool state = await AuthCubit.get(context).register(
        name: name.text,
        userName: userName.text,
        password: password.text,
      );

      if (state) {
        AppNavigator.pushRemove(context, const HomeScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            if(state is LoadingState) {
              return const CircularProgressIndicator();
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthScale(context, 20),
              ),
              child: Form(
                key: key,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Registration',
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
                        Icons.person_add_alt,
                        color: AppColors.darkGrey,
                        size: AppSize.widthScale(context, 100),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 40),
                      ),
                      CustomTextFormField(
                        hint: 'Name',
                        controller: name,
                        validator: (val) => AppValidators.required(value: val),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 8),
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
                        text: 'Registration',
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
