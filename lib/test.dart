import 'package:flutter/material.dart';
import 'package:udemy_mvvc_course/app/app.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void updateAppState() {
    MyApp.instance.appState = 12;
  }

  void getAppState() {
    // print(MyApp.instance.appState); //Will show 10
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
