import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:flutter/material.dart';

class ProductSpecs extends StatelessWidget {
  final ProductModel productModel;

  const ProductSpecs({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            productModel.modelTrim,
            style: const TextStyle(
              color: AppColors.nevada,
              fontSize: AppFontSizes.largeTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppTexts.brandNormal,
                style: TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                productModel.brand,
                style: const TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppTexts.priceNormal,
                style: TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                productModel.priceToString,
                style: const TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppTexts.colorNormal,
                style: TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                productModel.colour,
                style: const TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppTexts.weightNormal,
                style: TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                productModel.weight,
                style: const TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
