import 'package:flutter/material.dart';
import 'package:udemy_mvvc_course/presentation/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp({super.key});//Default constructor

  MyApp._internal(); //private named constructor

  int appState = 0;

  static final MyApp instance = MyApp._internal(); //singleton class

  factory MyApp() => instance; //factory form the class instance
  //?What is a factory?

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
