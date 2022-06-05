import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/routes/routes.dart';
import 'package:bliss_ecologital/services/app_data/cart_data_services.dart';
import 'package:bliss_ecologital/utilities/utils.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // variables
  var cartCount = 0.obs;

  var isAddedToFavorites = false.obs;

  var isAddedToCart = false.obs;

  @override
  void onInit() {
    cartCount.value = 0;

    isAddedToFavorites.value = false;

    isAddedToCart.value = false;

    super.onInit();
  }

  void loadData() {
    try {
      // get selected product from arguments
      final _productModel = Get.arguments as ProductModel;

      // check the selected product is added to favorites
      final _isAddedToFavorites = Utils.checkFavoriteList(_productModel);

      isAddedToFavorites.value = _isAddedToFavorites;

      // check the selected product is added to cart
      final _isAddedToCart = CartDataServices.checkCartList(_productModel);

      isAddedToCart.value = _isAddedToCart;

      // check cart count
      final _cartCount = CartDataServices.shared.count;

      cartCount.value = _cartCount;
    } catch (exception) {
      printError(
        info:
            'exception on product_controller loadData() function. ${exception.toString()}',
      );
    }
  }

  void handleCartTap() async {
    try {
      final _ = await Get.toNamed(Routes.checkoutPage);

      // if user remove products added to cart from the checkout page
      // need to reload status to check whether current product is still in the cart or not
      loadData();
    } catch (exception) {
      printError(
        info:
            'exception on product_controller handleCartTap() function. ${exception.toString()}',
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
            'exception on product_controller handleFavoriteTap() function. ${exception.toString()}',
      );
    }
  }

  void handleAddToCart(ProductModel productModel) {
    try {
      isAddedToCart.value
          ? CartDataServices.removeFromCartList(productModel)
          : CartDataServices.addToCartList(productModel);

      isAddedToCart.value = !isAddedToCart.value;

      final _cartCount = CartDataServices.shared.count;

      cartCount.value = _cartCount;
    } catch (exception) {
      printError(
        info:
            'exception on product_controller handleAddToCart() function. ${exception.toString()}',
      );
    }
  }
}
