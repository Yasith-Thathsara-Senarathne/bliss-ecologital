import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_enums.dart';
import 'package:bliss_ecologital/constants/app_images.dart';
import 'package:flutter/material.dart';

extension CategoryExtension on Category {
  String get convertValue {
    switch (this) {
      case Category.guitar:
        return 'Guitar';
      case Category.piano:
        return 'Piano';
      case Category.drums:
        return 'Drums';
      default:
        return 'None';
    }
  }

  String get title {
    switch (this) {
      case Category.guitar:
        return 'Guitar';
      case Category.piano:
        return 'Piano';
      case Category.drums:
        return 'Drums';
      default:
        return 'None';
    }
  }

  String get icon {
    switch (this) {
      case Category.guitar:
        return AppImages.categoryGuitarIcon;
      case Category.piano:
        return AppImages.categoryPianoIcon;
      case Category.drums:
        return AppImages.categoryDrumsIcon;
      default:
        return '';
    }
  }

  Color get bgColor {
    switch (this) {
      case Category.guitar:
        return AppColors.pinkSalmon;
      case Category.piano:
        return AppColors.grandis;
      case Category.drums:
        return AppColors.magicMint;
      default:
        return AppColors.pacificBlue;
    }
  }

  Color get detailBGColor {
    switch (this) {
      case Category.guitar:
        return AppColors.perfumeGuitar;
      case Category.piano:
        return AppColors.perfumePiano;
      case Category.drums:
        return AppColors.apricotPeach;
      default:
        return AppColors.pacificBlue;
    }
  }
}
