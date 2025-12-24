import 'package:get/get.dart';
import 'package:new_spinner/features/spinner/controller/spinner1_contoller.dart';

class Spinner1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Spinner1Controller>(
      () => Spinner1Controller(),
    );
  }
}
