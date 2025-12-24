import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:new_spinner/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final isPurchased = false.obs;

  @override
  void onInit() {
    _loadPurchase();
    super.onInit();
  }

  Future<void> _loadPurchase() async {
    final prefs = await SharedPreferences.getInstance();
    isPurchased.value = prefs.getBool('purchase') ?? false;
  }

  void openSpinner1() {
    // if (isPurchased.value) {
    Get.toNamed(AppRoutes.spinner1);
    // } else {
    //   Get.snackbar("Payment", "Please purchase first");
    // }
  }

  void openSpinner2() {
    // if (isPurchased.value) {
      Get.toNamed(AppRoutes.spinner2);
    // } else {
    //   Get.snackbar("Payment", "Please purchase first");
    // }
  }
}
