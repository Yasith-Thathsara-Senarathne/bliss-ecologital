import 'package:bliss_ecologital/constants/app_enums.dart';
import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:bliss_ecologital/routes/routes.dart';
import 'package:bliss_ecologital/services/remote_services.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // varibales
  var categoryList = [].obs;
  var productList = [].obs;

  var categoryLoading = false.obs;
  var productLoading = false.obs;

  @override
  void onInit() {
    categoryList.clear();

    productList.clear();

    categoryLoading.value = false;

    super.onInit();
  }

  @override
  void onReady() {
    _loadData();

    super.onReady();
  }

  @override
  void onClose() {
    categoryList.clear();

    productList.clear();

    categoryLoading.value = false;

    super.onClose();
  }

  void _loadData() {
    try {
      // load categories
      _loadCategories();

      // load most popular products
      _loadPopuloarProducts();

      return;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
      return;
    }
  }

  void _loadCategories() {
    try {
      // loading start
      categoryLoading.value = true;

      // add pre defined product categories with additional data ( category title, category icon, category bg color ) for render ui
      final _categories = [
        CategoryUIModel(
            categoryName: Category.guitar.title,
            categoryIcon: Category.guitar.icon,
            categoryBGColor: Category.guitar.bgColor),
        CategoryUIModel(
            categoryName: Category.piano.title,
            categoryIcon: Category.piano.icon,
            categoryBGColor: Category.piano.bgColor),
        CategoryUIModel(
            categoryName: Category.drums.title,
            categoryIcon: Category.drums.icon,
            categoryBGColor: Category.drums.bgColor),
      ];

      categoryList.value = _categories;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    } finally {
      // loading start
      categoryLoading.value = false;
    }
  }

  void _loadPopuloarProducts() async {
    try {
      productLoading.value = true;

      final _products = await RemoteServices.fetchProducts();

      if (_products.isEmpty) {
        productLoading.value = false;
        return;
      }

      productList.value = _products;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    } finally {
      productLoading.value = false;
    }
  }

  void onCategoryTapped(CategoryUIModel categoryUIModel) {
    try {
      Get.toNamed(
        Routes.productCategoryPage,
        arguments: categoryUIModel,
      );
    } catch (exception) {}
  }

  void onProductTapped(ProductModel productModel) {
    try {
      Get.toNamed(
        Routes.productPage,
        arguments: productModel,
      );
    } catch (exception) {}
  }
}
