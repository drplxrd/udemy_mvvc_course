import 'package:flutter/material.dart';
import 'package:udemy_mvvc_course/presentation/forgot_password/forgot_password.dart';
import 'package:udemy_mvvc_course/presentation/login/login.dart';
import 'package:udemy_mvvc_course/presentation/main/main_view.dart';
import 'package:udemy_mvvc_course/presentation/onbording/onboarding.dart';
import 'package:udemy_mvvc_course/presentation/register/register.dart';
import 'package:udemy_mvvc_course/presentation/resources/color_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/strings_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/styles_manager.dart';
import 'package:udemy_mvvc_course/presentation/store_details/store_details.dart';

import '../splash/splash.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onbording";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String registerRoute = "/register";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=>  const LoginView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
    Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        centerTitle: true,
        title: Text(AppStrings.noRouteFound, style: getRegularStyle(color: ColorManager.white),),

      ),
      body: Center(
        child: Text(AppStrings.noRouteFound, style: getRegularStyle(color: ColorManager.white),),
      ),
    )
    );
  }

}
