import 'package:get/get.dart';
import 'package:invoice_app/app/routes/app_routes.dart';
import 'package:invoice_app/app/view/login/login_screen.dart';
import 'package:invoice_app/app/view/register/register_screen.dart';
import 'package:invoice_app/app/view/splash/splash_screen.dart';

class AppPages {
  static const initial = ConstRoute.splash;

  static const duration = const Duration(milliseconds: 500);
  static const transition = Transition.rightToLeftWithFade;

  static List<GetPage> routes = [


    GetPage(
      name: ConstRoute.splash,
      page: () => const SplashScreen(),
      transitionDuration: duration,
      transition: transition,
    ),
    GetPage(
      name: ConstRoute.login,
      page: () => const LoginScreen(),
      transitionDuration: duration,
      transition: transition,
    ), GetPage(
      name: ConstRoute.register,
      page: () => RegisterScreen(),
      transitionDuration: duration,
      transition: transition,
    ),



  ];
}
