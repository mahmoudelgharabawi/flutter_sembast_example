import 'package:flutter/material.dart';
import 'package:flutter_sembast_example/app_style.dart';
import 'package:flutter_sembast_example/screens/task_list.dart';

void main() {
  runApp(TaskCrudApp());
}

class TaskCrudApp extends StatelessWidget with AppStyle {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: createLightTheme(),
      darkTheme: createDarkTheme(),
      title: "Sembast Task CRUD",
      home: TaskListScreen(),
    );
  }
}
