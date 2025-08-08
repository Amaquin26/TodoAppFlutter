import 'package:flutter/material.dart';
import 'package:todo_app_flutter/views/home/widgets/tasks_list_widget.dart';
import 'package:todo_app_flutter/widgets/modal/add_todotask_modal/add_todotask_modal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey, User 👋",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Here are your tasks for today",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            SizedBox(height: 16.0),
            TasksListWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            builder: ((context) {
              return AddTodoTaskModal();
            }),
          );
        },
        child: const Icon(Icons.assignment_add),
      ),
    );
  }
}
