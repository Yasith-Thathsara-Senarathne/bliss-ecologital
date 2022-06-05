import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/pages/product_page/product_controller.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';
import 'package:bliss_ecologital/widgets/product_widgets/cart_button.dart';
import 'package:bliss_ecologital/widgets/product_widgets/favorite_button.dart';
import 'package:bliss_ecologital/widgets/product_widgets/product_image.dart';
import 'package:bliss_ecologital/widgets/product_widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // varibales
  final _controller = Get.put(ProductController());

  final _productModel = Get.arguments as ProductModel;

  @override
  void initState() {
    _controller.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      backgroundColor: _productModel.category.detailBGColor,
      actions: [
        const Icon(
          Icons.share,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        Obx(
          () => FavoriteButton(
            isAddedToFavorites: _controller.isAddedToFavorites.value,
            onTapped: () {
              _controller.handleFavoriteTap(_productModel);
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Obx(
          () => CartButton(
            cartCount: _controller.cartCount.value,
            onTapped: () {
              _controller.handleCartTap();
            },
          ),
        ),
        const SizedBox(
          width: 18,
        ),
      ],
    );

    final _body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductImage(productModel: _productModel),
        Obx(
          () => ProductInfo(
            productModel: _productModel,
            addedToCart: _controller.isAddedToCart.value,
            onAddToCart: () {
              _controller.handleAddToCart(_productModel);
            },
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
