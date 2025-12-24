import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_spinner/app/core/constants/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Spinner1Controller extends GetxController {
  final firestore = FirebaseFirestore.instance;

  // final items = <String>[].obs;
  final selectedIndex = 0.obs;
  final isSpinning = false.obs;

  final StreamController<int> selected = StreamController<int>();

  late ConfettiController leftConfetti;
  late ConfettiController rightConfetti;

  final weights = <int>[80, 8, 5, 10, 2, 0];

  final items = <String>[
    Images.item1,
    Images.item3,
    Images.item2,
    Images.item5,
    Images.item4,
    Images.item6,
  ].obs;

  @override
  void onInit() {
    // fetchItems();
    leftConfetti = ConfettiController(duration: const Duration(seconds: 1));
    rightConfetti = ConfettiController(duration: const Duration(seconds: 1));
    super.onInit();
  }

  Future<void> fetchItems() async {
    try {
      final snapshot = await firestore
          .collection('ADMIN')
          .doc("spiner1")
          .collection("items")
          .get();

      final List<String> temp = [];

      for (var doc in snapshot.docs) {
        final data = doc.data();

        for (final value in data.values) {
          temp.add(value.toString());
        }
        items.value = temp;
      }
    } catch (e) {
      Get.snackbar("Firestore Error", e.toString());
    }
  }

  Future<void> spin() async {
    // final prefs = await SharedPreferences.getInstance();
    // if (prefs.getBool('purchase') != true) {
    //   Get.snackbar("Payment", "Please purchase first");
    //   return;
    // }

    isSpinning.value = true;

    final total = weights.reduce((a, b) => a + b);
    final rand = Random().nextInt(total);

    int sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += weights[i];
      if (rand < sum) {
        selectedIndex.value = i;
        break;
      }
    }

    selected.add(selectedIndex.value);
  }

  void onResult(BuildContext context) async {
    isSpinning.value = false;
    final reward = items[selectedIndex.value];
    bool isLose;
    if (items[selectedIndex.value] == 5.toString()) {
      isLose = true;
    } else {
      isLose = false;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return
         Material(
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
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: isLose
                          ? const LinearGradient(
                              colors: [Color(0xff1A1A1A), Color(0xff000000)],
                            )
                          : const LinearGradient(
                              colors: [Color(0xffFFD700), Color(0xffFF8C00)],
                            ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 30,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isLose ? "😢" : "🏆",
                          style: const TextStyle(fontSize: 64),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          isLose ? "TRY AGAIN" : "BIG WIN!",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: isLose ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (!isLose)
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
                        if (!isLose)
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

                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.all(
                            Radius.circular(8),
                          ),
                          child: Image(
                            image: AssetImage(reward),
                            width: 70,
                            height: 70,
                          ),
                        ),

                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isLose
                                  ? Colors.grey.shade900
                                  : Colors.black,
                              foregroundColor: isLose
                                  ? Colors.white
                                  : Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              isLose ? "OK" : "CLAIM REWARD",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                letterSpacing: 1.2,
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

    if (!isLose) {
      leftConfetti.play();
      rightConfetti.play();

      // final prefs = await SharedPreferences.getInstance();
      // await prefs.remove("purchase");
    }
  }

  @override
  void onClose() {
    selected.close();
    leftConfetti.dispose();
    rightConfetti.dispose();
    super.onClose();
  }
}
