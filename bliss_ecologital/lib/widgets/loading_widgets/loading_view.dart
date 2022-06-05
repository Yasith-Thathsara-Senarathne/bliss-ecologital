import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.nevada,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          AppTexts.loadingNormal,
          style: TextStyle(
            color: AppColors.nevada,
            fontSize: AppFontSizes.body,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
