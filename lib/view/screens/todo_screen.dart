import 'package:app1/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../card/task_card.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Provider.of<ToDoListController>(context, listen: false).addTask();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'ToDo Tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 15),
             /// for(int i = 0; i< list.length; i++)
              /// {
              /// 
              /// }
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return TaskCard(
                      taskName:
                          Provider.of<ToDoListController>(context).tasks[i],
                    );
                  },
                  separatorBuilder: (context, i) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemCount:
                  Provider.of<ToDoListController>(context).tasks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
