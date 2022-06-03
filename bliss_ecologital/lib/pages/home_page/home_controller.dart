import 'package:bliss_ecologital/constants/app_enums.dart';
import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:bliss_ecologital/services/remote_services.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // varibales
  var categoryList = [].obs;
  var productList = [].obs;

  var productLoading = false.obs;

  @override
  void onInit() {
    categoryList.clear();
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
    super.onClose();
  }

  Future _loadData() async {
    try {
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

      productLoading.value = true;

      final _products = await RemoteServices.fetchProducts();

      if (_products.isEmpty) {
        productLoading.value = false;
        return;
      }

      productList.value = _products;

      productLoading.value = false;

      return;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    }
  }
}
