import 'package:bliss_ecologital/constants/app_enums.dart';
import 'package:bliss_ecologital/utilities/extensions.dart';

abstract class Utils {
  // category enum value
  static Category categoryEnumValue(String name) {
    for (Category item in Category.values) {
      if (item.convertValue.toLowerCase() == name.toLowerCase()) {
        return item;
      }
    }
    return Category.none;
  }
}
