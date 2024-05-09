import 'package:flutter/material.dart';

class ContainerTextWidget extends StatelessWidget {
  const ContainerTextWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.bgColor,
  });

  final String text;
  final Color textColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        border:
            Border.all(color: Colors.red, width: 3, style: BorderStyle.solid),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          color: textColor,
          fontWeight: FontWeight.w900,
          // height: 10,
          // backgroundColor: Colors.grey
        ),
        overflow: TextOverflow.visible,
        maxLines: 2,
      ),
    );
  }
}

// width: 90,
// height: 90,
// padding: EdgeInsets.all(10),
// padding: EdgeInsets.only(left: 10, top: 20),
// padding: EdgeInsets.only(left: 10, right: 10),

// child:  RichText(
//   text: const TextSpan(
//     children: [
//       TextSpan(text: 'Home ', style: TextStyle(color: Colors.red, fontSize: 30)),
//       TextSpan(text: 'Screen', style: TextStyle(color: Colors.blue, fontSize: 20)),
//     ]
//   ),
// ),
