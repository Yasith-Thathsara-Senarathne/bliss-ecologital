import 'package:bliss_ecologital/constants/app_enums.dart';
import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';

abstract class Utils {
  // variables
  static var favoriteList = [];

  // category enum value
  static Category categoryEnumValue(String name) {
    try {
      for (Category item in Category.values) {
        if (item.convertValue.toLowerCase() == name.toLowerCase()) {
          return item;
        }
      }
    } catch (exception) {
      return Category.none;
    }

    return Category.none;
  }

  // check favorite list
  static bool checkFavoriteList(ProductModel productModel) {
    try {
      return favoriteList.contains(productModel.modelTrim) ? true : false;
    } catch (exception) {
      return false;
    }
  }

  // add to favorite list
  static void addToFavoriteList(ProductModel productModel) {
    try {
      favoriteList.add(productModel.modelTrim);
    } catch (exception) {
      return;
    }
  }

  // remove from favorite list
  static void removeFromFavoriteList(ProductModel productModel) {
    try {
      favoriteList.remove(productModel.modelTrim);
    } catch (exception) {
      return;
    }
  }
}
