import 'package:get/get.dart';
import 'package:new_spinner/features/spinner/controller/spinner2_contoller.dart';

class Spinner2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Spinner2Controller>(
      () => Spinner2Controller(),
    );
  }
}
