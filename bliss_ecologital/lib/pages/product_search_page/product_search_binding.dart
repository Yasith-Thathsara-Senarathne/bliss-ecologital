import 'package:bliss_ecologital/pages/product_search_page/product_search_controller.dart';
import 'package:get/get.dart';

class ProductSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductSearchController>(
      () => ProductSearchController(),
    );
  }
}
