import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:new_spinner/app/core/constants/app_assets.dart';
import 'package:new_spinner/features/home/controller/home_controller.dart';
import 'package:new_spinner/features/widgets/start_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffBB0109), Color(0xff420003)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Image.asset(Images.playWin, width: 200),
            const SizedBox(height: 40),

            Image.asset(Images.spin, width: 250),
            StartButtton(ontap: controller.openSpinner1),

            const SizedBox(height: 40),

            Image.asset(Images.slot, width: 250),
            StartButtton(ontap: controller.openSpinner2),
          ],
        ),
      ),
    );
  }
}
