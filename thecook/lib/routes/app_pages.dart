import 'package:get/get.dart';
import 'package:thecook/app/modules/auth_login/binding/auth_binding.dart';
import 'package:thecook/app/modules/auth_login/view/auth_view.dart';
import 'package:thecook/app/modules/home/binding/home_binding.dart';
import 'package:thecook/app/modules/home/view/home_view.dart';
import 'package:thecook/app/modules/onboarding/binding/onboarding_binding.dart';
import 'package:thecook/app/modules/onboarding/view/onboarding_view.dart';
import 'package:thecook/app/modules/splash/binding/splash_binding.dart';
import 'package:thecook/app/modules/splash/views/splash_view.dart';
import 'package:thecook/app/modules/register/binding/register_binding.dart';
import 'package:thecook/app/modules/register/view/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
