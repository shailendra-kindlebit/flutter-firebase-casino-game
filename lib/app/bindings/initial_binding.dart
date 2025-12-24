import 'package:get/get.dart';
import 'package:new_spinner/features/spinner/controller/spinner1_contoller.dart';
import 'package:new_spinner/features/spinner/controller/spinner2_contoller.dart';
import '../../features/splash/controller/splash_controller.dart';
import '../../features/home/controller/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.lazyPut(() => Spinner1Controller());
    Get.lazyPut(() => Spinner2Controller());
  }
}
