import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // varibales
  final _productModel = Get.arguments as ProductModel;

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      backgroundColor: _productModel.category.detailBGColor,
      actions: const [
        Icon(
          Icons.share,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.favorite,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        SizedBox(
          width: 18,
        ),
      ],
    );

    final _body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 18,
            right: 18,
          ),
          child: Center(
            child: Image.network(
              _productModel.image,
              fit: BoxFit.fitHeight,
              // height: Get.width * 0.7,
              color: _productModel.category.detailBGColor,
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: _productModel.category.detailBGColor,
      appBar: _appBar,
      body: _body,
    );
  }
}
