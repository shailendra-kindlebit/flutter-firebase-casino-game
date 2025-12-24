import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:new_spinner/app/routes/app_routes.dart';
import 'package:new_spinner/features/home/bindings/home_binding.dart';
import 'package:new_spinner/features/home/view/home_page.dart';
import 'package:new_spinner/features/spinner/bindings/spinner1_binding.dart';
import 'package:new_spinner/features/spinner/bindings/spinner2_binding.dart';
import 'package:new_spinner/features/spinner/view/spinner1_page.dart';
import 'package:new_spinner/features/spinner/view/spinner2_page.dart';
import 'package:new_spinner/features/splash/view/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.spinner1,
      page: () => const Spinner1Page(),
       binding: Spinner1Binding(),
    ),
    GetPage(
      name: AppRoutes.spinner2,
      page: () => const Spinner2Page(),
     binding: Spinner2Binding(),
    ),
  ];
}
