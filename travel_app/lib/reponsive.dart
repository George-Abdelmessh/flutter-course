import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: (screenWidth * 25/ 100) ,
              height: screenHeight,
              color: Colors.red,
            ),
            Container(
              width: (screenWidth * 25/ 100),
              height: screenHeight,
              color: Colors.blue,
            ),
            Container(
              width: (screenWidth * 25/ 100),
              height: screenHeight,
              color: Colors.grey,
            ),
            Container(
              width: (screenWidth * 25/ 100),
              height: screenHeight,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
