import 'package:app1/core/app_helper/app_navigator.dart';
import 'package:app1/core/app_helper/app_validators.dart';
import 'package:app1/view/widget/custom_text_button.dart';
import 'package:app1/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> signUpHandler() async {
    if (key.currentState!.validate()) {
      final SignupController signup = SignupController();

      await signup.saveData(
        firstName.text,
        lastName.text,
        user.text,
        password.text,
      ).then((value) {
        if (value) {
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 4),
                        // blurRadius:
                        blurRadius: 4,
                        spreadRadius: 0),
                  ],
                  color: Color(0xff8B19C1),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20),
                    right: Radius.circular(20),
                  )),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 29),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hint: 'FirstName',
                            controller: firstName,
                            validator: (val) => AppValidators.required(
                              value: val,
                            ),
                            fillColor: Colors.white,
                            isFilled: true,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            hint: 'LastName',
                            controller: lastName,
                            fillColor: Colors.white,
                            validator: (val) => AppValidators.required(
                              value: val,
                            ),
                            isFilled: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hint: '@UserName',
                      controller: user,
                      fillColor: Colors.white,
                      validator: (val) => AppValidators.required(
                        value: val,
                      ),
                      isFilled: true,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hint: 'Password',
                      controller: password,
                      fillColor: Colors.white,
                      validator: (val) => AppValidators.required(
                        value: val,
                      ),
                      isFilled: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: CustomTextButton(
                text: 'Sign up',
                bgColor: const Color(0xff8B19C1),
                onTap: () => signUpHandler(),
              ),
            ),
            const SizedBox(height: 22),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 3,
                    color: Colors.grey,
                    indent: 20,
                    endIndent: 12,
                  ),
                ),
                Text(
                  'OR login with',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 3,
                    color: Colors.grey,
                    indent: 12,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 4),
                          // blurRadius:
                          blurRadius: 4,
                          spreadRadius: 0),
                    ],
                  ),
                  child: Image.network(
                    'https://i.postimg.cc/tTycFRRD/apple-icon.webp',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(width: 43),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 4),
                          // blurRadius:
                          blurRadius: 4,
                          spreadRadius: 0),
                    ],
                  ),
                  child: Image.network(
                    'https://i.postimg.cc/tTycFRRD/apple-icon.webp',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => AppNavigator.pop(context),
              child: RichText(
                text: const TextSpan(
                  // text: '',
                  children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign in',
                      style: TextStyle(
                        color: Color(0xff8B19C1),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
