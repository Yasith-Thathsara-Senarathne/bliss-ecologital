import 'package:bliss_ecologital/pages/product_category_page/product_category_controller.dart';
import 'package:get/get.dart';

class ProductCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductCategoryController>(
      () => ProductCategoryController(),
    );
  }
}
