import 'dart:convert';

import 'package:bliss_ecologital/models/data_models/product_model.dart';

class SingleAPIResponseModel<T> {
  final bool status;

  final T result;

  SingleAPIResponseModel({
    required this.status,
    required this.result,
  });

  // SingleAPIResponseModel? convertToGenaricModelType(String jsonString) {
  //   final _ = json.decode(jsonString);
  //   switch (T) {
  //     default:
  //       return null;
  //   }
  // }
}
