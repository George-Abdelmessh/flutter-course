import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Layout Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.grey[300],
            child: const Icon(
              Icons.image,
              size: 100,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Visitors',
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.access_alarms,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.accessibility_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  Text(
                    'Call',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.telegram,
                    size: 30,
                  ),
                  Text(
                    'Route',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.share,
                    size: 30,
                  ),
                  Text(
                    'Share',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
