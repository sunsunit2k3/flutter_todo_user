import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/navigator.dart';
import 'package:flutter_todo/src/view_models/todo_viewmodel.dart';
import 'package:flutter_todo/src/views/todo_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ToDoViewModel>(
            create: (_) => ToDoViewModel(NavigationService.instance))
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ToDoList(),
      ),
    );
  }
}
