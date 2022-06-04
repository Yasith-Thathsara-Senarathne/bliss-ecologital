import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularListTile extends StatelessWidget {
  final ProductModel productModel;

  const PopularListTile({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: productModel.category.detailBGColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                productModel.model.trim(),
                style: const TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.smallTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
          Image.network(
            productModel.image,
            width: Get.width * 0.4,
            height: Get.width * 0.4,
            color: productModel.category.detailBGColor,
            colorBlendMode: BlendMode.darken,
          ),
        ],
      ),
    );
  }
}
