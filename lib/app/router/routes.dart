import 'package:counting_love_day/presentation/components/start_app.dart';
import 'package:counting_love_day/presentation/views/login_screen.dart';
import 'package:counting_love_day/presentation/views/verify_email_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signUpScreen';
  static String verifyEmailScreen = '/verifyEmailScreen';
  static String homeScreen = '/homeScreen';
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
    page: () => const StartApp(),
  ),
];
