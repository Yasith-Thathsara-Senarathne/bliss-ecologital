import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_images.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppTexts.blissUpperCased,
            style: TextStyle(
              color: AppColors.pacificBlue,
              fontSize: AppFontSizes.largeTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: preferredSize.height,
            height: preferredSize.height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.pacificBlue,
              borderRadius: BorderRadius.circular(preferredSize.height / 2),
            ),
            child: Image.asset(
              AppImages.userImage,
            ),
          ),
        ],
      ),
    );
  }
}
