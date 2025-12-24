import 'dart:math';
import 'dart:ui';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:get/get.dart';
import 'package:new_spinner/app/core/constants/app_assets.dart';

class Spinner2Controller extends GetxController {
  final isStarted = false.obs;
  late SlotMachineController machineController;
  List<int> resultIndexes = [];
  int currentReelIndex = 0;
  final items = <String>[Images.item1, Images.item2, Images.item3].obs;
  late ConfettiController leftConfetti;
  late ConfettiController rightConfetti;

  @override
  void onInit() {
    leftConfetti = ConfettiController(duration: const Duration(seconds: 1));
    rightConfetti = ConfettiController(duration: const Duration(seconds: 1));
    super.onInit();
  }

  Future<void> start() async {
    isStarted.value = true;
    currentReelIndex = 0;
    final index = Random().nextInt(20);
    machineController.start(hitRollItemIndex: index < 3 ? index : null);
    Future.delayed(const Duration(seconds: 3), stopNextReel);
    Future.delayed(const Duration(seconds: 5), stopNextReel);
    Future.delayed(const Duration(seconds: 7), stopNextReel);
  }

  void stopNextReel() {
    machineController.stop(reelIndex: currentReelIndex);
    currentReelIndex++;
    if (currentReelIndex > 2) {
      currentReelIndex = 0;
    }
  }

  void onFinished(List<int> indexes) {
    isStarted.value = false;
    resultIndexes = indexes;

    final bool allSame = indexes.every((e) => e == indexes.first);

    Future.delayed(const Duration(seconds: 1), () {
      if (allSame) {
        leftConfetti.play();
        rightConfetti.play();
        _showDialog(isWin: true);
        return;
      } else {
        _showDialog(isWin: false);
      }
    });
  }

  void _showDialog({required bool isWin}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(color: Colors.black.withOpacity(0.35)),
              ),

              Center(
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOutBack,
                  tween: Tween(begin: 0.6, end: 1),
                  builder: (_, scale, child) =>
                      Transform.scale(scale: scale, child: child),
                  child: Container(
                    width: Get.width * 0.85,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xffFFD700), Color(0xffFFA500)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 30,
                          offset: Offset(0, 15),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          !isWin ? "😢" : "🏆",
                          style: const TextStyle(fontSize: 64),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          !isWin ? "TRY AGAIN" : "YOU WIN!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            color: !isWin ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (isWin)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ConfettiWidget(
                              confettiController: leftConfetti,
                              blastDirection: 0,
                              emissionFrequency: 0.04,
                              numberOfParticles: 15,
                              gravity: 0.15,
                            ),
                          ),
                        if (isWin)
                          Align(
                            alignment: Alignment.centerRight,
                            child: ConfettiWidget(
                              confettiController: rightConfetti,
                              blastDirection: pi,
                              emissionFrequency: 0.04,
                              numberOfParticles: 15,
                              gravity: 0.15,
                            ),
                          ),

                        if (isWin)
                          const Text(
                            "Congratulations 🎉",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: Get.back,
                            child: Text(
                              !isWin ? "OK" : "COLLECT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
