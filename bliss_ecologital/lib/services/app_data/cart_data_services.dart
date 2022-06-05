import 'package:bliss_ecologital/models/data_models/product_model.dart';

class CartDataServices {
  static List<ProductModel> _list = [];

  CartDataServices._privateConstructor();

  static final _shared = CartDataServices._privateConstructor();

  static CartDataServices get shared => _shared;

  int get count => _list.length;

  List<ProductModel> get list => _list;

  double get total => _calculateTotal();

  // initialize
  static void initialize() {
    try {
      _list = [];
    } catch (exception) {
      return;
    }
  }

  // check cart list
  static bool checkCartList(ProductModel productModel) {
    bool returnValue = false;
    try {
      for (var element in _list) {
        if (element.modelTrim == productModel.modelTrim) {
          returnValue = true;
        }
        continue;
      }
    } catch (exception) {
      return false;
    }
    return returnValue;
  }

  // add to cart list
  static void addToCartList(ProductModel productModel) {
    try {
      _list.add(productModel);
    } catch (exception) {
      return;
    }
  }

  // remove from cart list
  static void removeFromCartList(ProductModel productModel) {
    try {
      for (var element in _list) {
        if (element.modelTrim == productModel.modelTrim) {
          _list.remove(element);
        }
        continue;
      }
    } catch (exception) {
      return;
    }
  }

  static double _calculateTotal() {
    double returnValue = 0.0;
    try {
      var _total = 0.0;
      for (var element in _list) {
        _total += element.price;
      }

      returnValue = _total;
    } catch (exception) {
      return 0.0;
    }
    return returnValue;
  }
}
