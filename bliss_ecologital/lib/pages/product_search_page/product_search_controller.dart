import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/routes/routes.dart';
import 'package:bliss_ecologital/services/remote_services.dart';
import 'package:get/get.dart';

class ProductSearchController extends GetxController {
  // varibales
  var productSearchList = [].obs;

  var _productSearchList = [];

  var productSearchLoading = false.obs;

  @override
  void onInit() {
    productSearchList.clear();

    productSearchLoading.value = false;

    super.onInit();
  }

  void loadData() {
    try {
      // load product categories
      _loadProductSearch();

      return;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
      return;
    }
  }

  void _loadProductSearch() async {
    try {
      productSearchLoading.value = true;

      final _products = await RemoteServices.fetchProducts();

      if (_products.isEmpty) {
        productSearchLoading.value = false;
        return;
      }

      productSearchList.value = _products;
      _productSearchList = _products;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    } finally {
      productSearchLoading.value = false;
    }
  }

  void onSeachTextChange(String searchText) async {
    try {
      if (searchText.isEmpty) {
        productSearchLoading.value = true;

        productSearchList.value = _productSearchList;

        productSearchLoading.value = false;

        return;
      }

      productSearchLoading.value = true;

      // filter all products to selected category
      final _filteredList = _productSearchList
          .where(
            (element) => element.modelTrim.toLowerCase().contains(searchText),
          )
          .toList();

      productSearchList.value = _filteredList;
    } catch (exception) {
      printError(
        info:
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    } finally {
      productSearchLoading.value = false;
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
            'exception on home controller _loadData() function. ${exception.toString()}',
      );
    }
  }
}
