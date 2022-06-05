import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenAlertView extends StatelessWidget {
  final String message;

  final IconData icon;

  const FullscreenAlertView({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          icon,
          color: AppColors.pacificBlue,
          size: Get.width * 0.4,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            message,
            style: const TextStyle(
              color: AppColors.nevada,
              fontSize: AppFontSizes.smallTitle,
            ),
          ),
        )
      ],
    );
  }
}
