import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  final ProductModel productModel;

  const ProductImage({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        left: 18,
        right: 18,
      ),
      height: Get.height * 0.4,
      alignment: Alignment.center,
      child: Image.network(
        productModel.image,
        fit: BoxFit.fill,
        color: productModel.category.detailBGColor,
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}
