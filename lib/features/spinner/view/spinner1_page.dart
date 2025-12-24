import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:new_spinner/app/core/constants/app_assets.dart';
import 'package:new_spinner/app/core/constants/app_colors.dart';
import 'package:new_spinner/features/widgets/spiner_dot_ring.dart';
import '../controller/spinner1_contoller.dart';

class Spinner1Page extends GetView<Spinner1Controller> {
  const Spinner1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppGradients.background,
              ),
            ),
          ),

          // 🎉 CONFETTI
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: ConfettiWidget(
          //     confettiController: controller.leftConfetti,
          //     blastDirection: 0,
          //     emissionFrequency: 0.04,
          //     numberOfParticles: 15,
          //     gravity: 0.15,
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: ConfettiWidget(
          //     confettiController: controller.rightConfetti,
          //     blastDirection: pi,
          //     emissionFrequency: 0.04,
          //     numberOfParticles: 15,
          //     gravity: 0.15,
          //   ),
          // ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    ),
                    onPressed: Get.back,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "SPIN & WIN",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Try your luck",
                  style: TextStyle(
                    color: AppColors.white70,
                    fontSize: 14,
                    letterSpacing: 1.2,
                  ),
                ),
                // const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Obx(
                      () => controller.items.length < 2
                          ? const CircularProgressIndicator(
                              color: AppColors.white,
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.yellow,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 30,
                                        offset: Offset(0, 20),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.red,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 30,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: const SpinnerDotsRing(
                                      dotsCount: 18,
                                      radius: 162,
                                      dotSize: 10,
                                    ),
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.yellow,
                                  ),
                                  child: SizedBox(
                                    height: 280,
                                    width: 280,
                                    child: FortuneWheel(
                                      selected: controller.selected.stream,
                                      animateFirst: false,
                                      indicators: const [
                                        FortuneIndicator(
                                          alignment: Alignment.topCenter,
                                          child: TriangleIndicator(
                                            color: AppColors.red,
                                            width: 25,
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                      items: controller.items.asMap().entries.map((
                                        entry,
                                      ) {
                                        final index = entry.key;
                                        final image = entry.value;
                                        final isYellow = index.isEven;

                                        return FortuneItem(
                                          style: FortuneItemStyle(
                                            color: isYellow
                                                ? AppColors.yellow
                                                : AppColors.white,
                                            borderColor: Colors.transparent,
                                            textAlign: TextAlign.center,
                                            textStyle: const TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 25),
                                            child: Center(
                                              child: Image.asset(
                                                image,
                                                width: 60,
                                                height: 60,
                                              ),
                                            ),
                                          ),
                                          //  Padding(
                                          //   padding:
                                          //       const EdgeInsets.symmetric(
                                          //         horizontal: 8,
                                          //       ),
                                          //   child: Text(
                                          //     text,
                                          //     textAlign: TextAlign.center,
                                          //     style: const TextStyle(
                                          //       fontSize: 14,
                                          //       fontWeight: FontWeight.bold,
                                          //     ),
                                          //   ),
                                          // ),
                                        );
                                      }).toList(),
                                      onAnimationEnd: () =>
                                          controller.onResult(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Obx(
                  () => controller.isSpinning.value
                      ? const SizedBox(height: 50)
                      : GestureDetector(
                          onTap: controller.spin,
                          child: Image.asset(Images.startButton, width: 120),
                        ),
                  // GestureDetector(
                  //     onTap: controller.spin,
                  //     child: Container(
                  //       height: 56,
                  //       width: 220,
                  //       decoration: BoxDecoration(
                  //         gradient: const LinearGradient(
                  //           colors: [Color(0xffFFD700), Color(0xffFFA500)],
                  //         ),
                  //         borderRadius: BorderRadius.circular(30),
                  //         boxShadow: const [
                  //           BoxShadow(
                  //             color: Colors.black54,
                  //             blurRadius: 15,
                  //             offset: Offset(0, 10),
                  //           ),
                  //         ],
                  //       ),
                  //       alignment: Alignment.center,
                  //       child: const Text(
                  //         "SPIN NOW",
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w900,
                  //           letterSpacing: 1.5,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
