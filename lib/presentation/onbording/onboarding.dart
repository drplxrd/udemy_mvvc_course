import 'package:flutter/material.dart';
import 'package:udemy_mvvc_course/presentation/resources/color_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body:const Center(
        child:  Text(AppStrings.welcome,
          // style: getRegularStyle(color: ColorManager.white),
        ),
      ),
    );
  }
}
