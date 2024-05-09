import 'package:app1/core/storage/cache_manager.dart';
import 'package:app1/view/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

import '../widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void deleteHandler(BuildContext context) {
    CacheManager.removeData(key: 'user');
    CacheManager.removeData(key: 'pass');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red[500],
      // backgroundColor: Colors.red,
      backgroundColor: const Color(0xFF466D8D),
      // backgroundColor: Color.fromARGB(255, 190, 49, 49),
      // backgroundColor: Color.fromRGBO(55, 47, 133, 0.5019607843137255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: ContainerTextWidget(
              text: 'Home Screen!',
              textColor: Colors.white,
              bgColor: Colors.black45,
            ),
          ),
          const SizedBox(height: 20),
          CustomTextButton(
            onTap: () => deleteHandler(context),
            text: 'Delete Account',
          ),
        ],
      ),
    );
  }
}
