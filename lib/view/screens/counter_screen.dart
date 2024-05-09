import 'package:app1/view/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/counter_controller.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late final counter = Provider.of<CounterController>(context);
  late final provider = Provider.of<CounterController>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              counter.count.toString(),
              style: const TextStyle(fontSize: 25),
            )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  text: '+',
                  onTap: () {
                    provider.increment();
                  },
                ),
                const SizedBox(width: 10),
                CustomTextButton(
                  text: 'reset',
                  onTap: () {
                    provider.reset();
                  },
                ),
                const SizedBox(width: 10),
                CustomTextButton(
                  text: '-',
                  onTap: () {
                    provider.decrement();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class CounterScreen extends StatelessWidget {
//   const CounterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Counter.increment();
//           print(Counter.count);
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.blue,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//                 child: Text(
//               Counter.count.toString(),
//                   style: TextStyle(
//                     fontSize: 25
//                   ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
