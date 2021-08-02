import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};


List<GetPage<dynamic>> getPages = [
  GetPage(
      name: SplashScreen.routeName,
      page: () => SplashScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: SignInScreen.routeName,
      page: () => SignInScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => ForgotPasswordScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: LoginSuccessScreen.routeName,
      page: () => LoginSuccessScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: SignUpScreen.routeName,
      page: () => SignUpScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: CompleteProfileScreen.routeName,
      page: () => CompleteProfileScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: OtpScreen.routeName,
      page: () => OtpScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: HomeScreen.routeName,
      page: () => HomeScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: DetailsScreen.routeName,
      page: () => DetailsScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: CartScreen.routeName,
      page: () => CartScreen(),
      transition: Transition.zoom
  ),
  GetPage(
      name: ProfileScreen.routeName,
      page: () => ProfileScreen(),
      transition: Transition.zoom
  )
];
