import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/utilities/utils.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // variables
  var cartCount = 0.obs;

  var isAddedToFavorites = false.obs;

  @override
  void onInit() {
    cartCount.value = 0;

    isAddedToFavorites.value = false;

    super.onInit();
  }

  @override
  void onReady() {
    _loadData();

    super.onReady();
  }

  @override
  void onClose() {
    cartCount.value = 0;

    isAddedToFavorites.value = false;

    super.onClose();
  }

  void _loadData() {
    try {
      final _productModel = Get.arguments as ProductModel;

      final _isAddedToFavorites = Utils.checkFavoriteList(_productModel);

      isAddedToFavorites.value = _isAddedToFavorites;

      final _cartCount = Utils.checkCartList();

      cartCount.value = _cartCount;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    }
  }

  void handleFavoriteTap(ProductModel productModel) {
    try {
      isAddedToFavorites.value
          ? Utils.removeFromFavoriteList(productModel)
          : Utils.addToFavoriteList(productModel);

      isAddedToFavorites.value = !isAddedToFavorites.value;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    }
  }

  void handleAddToCart(ProductModel productModel) {
    try {
      Utils.addToCartList(productModel);

      final _cartCount = Utils.checkCartList();

      cartCount.value = _cartCount;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    }
  }
}
