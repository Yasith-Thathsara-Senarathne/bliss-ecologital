import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:bliss_ecologital/routes/routes.dart';
import 'package:bliss_ecologital/services/remote_services.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController {
  // varibales
  var productCategoryList = [].obs;

  var productCategoryLoading = false.obs;

  @override
  void onInit() {
    productCategoryList.clear();

    productCategoryLoading.value = false;

    super.onInit();
  }

  void loadData() {
    try {
      // load product categories
      _loadProductCategory();

      return;
    } catch (exception) {
      printError(
        info:
            'exception on product_category_controller _loadData() function. ${exception.toString()}',
      );
      return;
    }
  }

  void _loadProductCategory() async {
    try {
      productCategoryLoading.value = true;

      final _productCategories = await RemoteServices.fetchProducts();

      if (_productCategories.isEmpty) {
        productCategoryLoading.value = false;
        return;
      }

      final _categoryUIModel = Get.arguments as CategoryUIModel;

      // filter all products to selected category
      final _filteredList = _productCategories
          .where((element) =>
              element.category.name.toLowerCase() ==
              _categoryUIModel.categoryName.toLowerCase())
          .toList();

      productCategoryList.value = _filteredList;
    } catch (exception) {
      printError(
        info:
            'exception on product_category_controller _loadProductCategory() function. ${exception.toString()}',
      );
    } finally {
      productCategoryLoading.value = false;
    }
  }

  void onProductTapped(ProductModel productModel) {
    try {
      Get.toNamed(
        Routes.productPage,
        arguments: productModel,
      );
    } catch (exception) {
      printError(
        info:
            'exception on product_category_controller onProductTapped() function. ${exception.toString()}',
      );
    }
  }
}
