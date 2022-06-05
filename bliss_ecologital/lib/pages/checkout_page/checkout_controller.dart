import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/services/app_data/cart_data_services.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  // varibales
  var cartList = [].obs;

  var total = 0.00.obs;

  var cartLoading = false.obs;

  @override
  void onInit() {
    cartList.clear();

    cartLoading.value = false;

    super.onInit();
  }

  void loadData() {
    try {
      // load cart list
      _loadCartList();

      return;
    } catch (exception) {
      printError(
        info:
            'exception on checkout_controller _loadData() function. ${exception.toString()}',
      );
      return;
    }
  }

  void _loadCartList() async {
    try {
      cartLoading.value = true;

      cartList.value = CartDataServices.shared.list;

      total.value = CartDataServices.shared.total;
    } catch (exception) {
      printError(
        info:
            'exception on checkout_controller _loadCartList() function. ${exception.toString()}',
      );
    } finally {
      cartLoading.value = false;
    }
  }

  void handleOnProductRemove(ProductModel productModel) {
    try {
      CartDataServices.removeFromCartList(productModel);

      cartList.value = CartDataServices.shared.list;

      total.value = CartDataServices.shared.total;
    } catch (exception) {
      printError(
        info:
            'exception on checkout_controller handleOnProductRemove() function. ${exception.toString()}',
      );
    }
  }
}
