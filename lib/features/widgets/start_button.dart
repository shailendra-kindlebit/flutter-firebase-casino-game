import 'package:flutter/material.dart';
import 'package:new_spinner/app/core/constants/app_assets.dart';

class StartButtton extends StatelessWidget {
  const StartButtton({super.key, required this.ontap});

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        onPressed: ontap,
        child: Image.asset(
          Images.startButton,
          height: 30,
        ),
      ),
    );
  }
}