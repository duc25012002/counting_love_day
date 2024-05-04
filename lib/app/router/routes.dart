import 'package:counting_love_day/presentation/components/compotnent_bottom_nav_bar.dart';
import 'package:counting_love_day/presentation/views/login_screen.dart';
import 'package:counting_love_day/presentation/views/settings_screen.dart';
import 'package:counting_love_day/presentation/views/sign_up_screen.dart';

import 'package:counting_love_day/presentation/views/verify_email_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signUpScreen';
  static String verifyEmailScreen = '/verifyEmailScreen';
  static String homeScreen = '/homeScreen';
  static String settingsScreen = '/settingsScreen';
  static String startApp = '/startApp';
}

final getPages = [
  GetPage(
    name: Routes.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: Routes.verifyEmailScreen,
    page: () => const VerifyEmailScreen(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () => const BottomNavigationBar(),
  ),
  GetPage(
    name: Routes.settingsScreen,
    page: () => const SettingScreen(),
  ),
  GetPage(
    name: Routes.startApp,
    page: () => const BottomNavigationBar(),
  ),
  GetPage(
    name: Routes.signUpScreen,
    page: () => const SignUpScreen(),
  ),
];