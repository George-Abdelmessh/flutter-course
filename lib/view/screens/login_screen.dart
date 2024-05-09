import 'package:app1/core/app_helper/app_navigator.dart';
import 'package:app1/core/app_helper/app_validators.dart';
import 'package:app1/view/screens/home_screen.dart';
import 'package:app1/view/screens/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/custom_text_button.dart';
import '../widget/custom_text_form_field.dart';
import '../../controller/login_contorller.dart';
import '../../controller/password_visibilty_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late final PasswordVisibilityController uiController =
      Provider.of<PasswordVisibilityController>(context);


  void changeVisibility() {
    Provider.of<PasswordVisibilityController>(context, listen: false)
        .changeVisibility();
  }

  Future<void> loginHandler() async {
    if (key.currentState!.validate()) {
      final LoginController login = LoginController();
      await login
          .login(
        userNameController.text,
        passwordController.text,
      )
          .then((state) {
        if (state) {
          AppNavigator.push(context, const HomeScreen());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 350,
                      decoration: const BoxDecoration(
                          color: Color(0x7ebdf1ff),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          )
                          // borderRadius: BorderRadius.only(
                          //   bottomRight: Radius.circular(50),
                          //   bottomLeft: Radius.circular(50),
                          // )
                          ),
                    ),
                    Image.asset(
                      'assets/images/for_women.png',
                      width: 250,
                      height: 250,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        controller: userNameController,
                        hint: 'UserName',
                        validator: (val) => AppValidators.required(value: val),
                        prefix: const Icon(Icons.abc),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        hint: 'Password',
                        validator: (val) => AppValidators.required(
                          value: val,
                          error: 'Password is Req',
                        ),
                        secureText: uiController.isVisible,
                        prefix: const Icon(Icons.lock),
                        suffix: GestureDetector(
                          onTap: () => changeVisibility(),
                          child: Icon(uiController.isVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextButton(
                              text: 'Sign in',
                              radius: 20,
                              // onTap: () {
                              //   loginHandler();
                              // },
                              onTap: () => loginHandler(),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomTextButton(
                              text: 'Sign up',
                              bgColor: Colors.purpleAccent,
                              radius: 20,
                              onTap: () => AppNavigator.push(
                                  context, const SignUpScreen()),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Stack(
//   children: [
//     Container(
//       width: 200,
//       height: 200,
//       color: Colors.blueAccent,
//     ),
//     Positioned(
//       bottom: 0,
//       child: Container(
//         width: 100,
//         height: 100,
//         color: Colors.red,
//       ),
//     ),
//     Positioned(
//       right: 10,
//       bottom: 10,
//       child: Container(
//         width: 50,
//         height: 50,
//         color: Colors.amber,
//       ),
//     )
//   ],
// )
