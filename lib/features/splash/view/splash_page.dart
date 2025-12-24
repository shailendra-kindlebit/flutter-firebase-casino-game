import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:new_spinner/app/core/constants/app_assets.dart';
import 'package:new_spinner/features/splash/controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffBB0109), Color(0xff420003)],
          ),
        ),
        child:  Center(
          child: Image(
            image: AssetImage(Images.splashImg),
            width: 250,
          ),
        ),
      ),
    );
  }
}
