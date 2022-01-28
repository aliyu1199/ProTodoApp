import 'package:flutter/material.dart';
import 'package:pro_todo/provider/todos.dart';
import 'package:pro_todo/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = "Pro Todo";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pro Todo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffFEF4FF),
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomePage(),
      ),
    );
  }
}

