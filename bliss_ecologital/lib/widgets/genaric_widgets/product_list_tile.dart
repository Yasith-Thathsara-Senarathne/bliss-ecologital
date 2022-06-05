import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListTile extends StatelessWidget {
  final ProductModel productModel;

  final bool showRemove;

  const ProductListTile({
    Key? key,
    required this.productModel,
    this.showRemove = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: productModel.category.detailBGColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                productModel.image,
                width: Get.width * 0.4,
                height: Get.width * 0.3,
                color: productModel.category.detailBGColor,
                colorBlendMode: BlendMode.darken,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.modelTrim,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    productModel.priceWithCurrency,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          showRemove
              ? const Positioned(
                  right: 0,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
