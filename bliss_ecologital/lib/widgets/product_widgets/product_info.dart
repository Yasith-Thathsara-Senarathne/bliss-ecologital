import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/widgets/genaric_widgets/button_with_text.dart';
import 'package:bliss_ecologital/widgets/product_widgets/product_specs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel productModel;

  final bool addedToCart;

  final VoidCallback onAddToCart;

  const ProductInfo({
    Key? key,
    required this.productModel,
    required this.addedToCart,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.45,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.45),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductSpecs(
            productModel: productModel,
          ),
          ButtonWithText(
            title: addedToCart
                ? AppTexts.removeFromCartNormal
                : AppTexts.addToCartNormal,
            bgColor: addedToCart ? AppColors.torchRed : AppColors.pacificBlue,
            height: 45,
            fontSize: AppFontSizes.button,
            onTapped: () {
              onAddToCart();
            },
          ),
        ],
      ),
    );
  }
}
