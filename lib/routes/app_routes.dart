import 'package:get/get.dart';
import 'package:shrine_theme/screens/home/home_binding.dart';
import 'package:shrine_theme/screens/home/home_screen.dart';
import 'package:shrine_theme/screens/login/login_binding.dart';
import 'package:shrine_theme/screens/login/login_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
      binding: HomeBinding(),
    ),
  ];
}