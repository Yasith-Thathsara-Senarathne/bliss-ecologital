import 'dart:convert';
import 'package:bliss_ecologital/models/data_models/product_model.dart';

class ListAPIResponseModel<T> {
  final bool? status;

  final List<T>? result;

  ListAPIResponseModel({
    this.status,
    this.result,
  });

  ListAPIResponseModel convertToGenaricModelType(String jsonString) {
    final jsonObj = json.decode(jsonString);

    switch (T) {
      case ProductModel:
        return ListAPIResponseModel(
          status: jsonObj["status"] ?? false,
          result: List<ProductModel>.from(
            jsonObj["result"].map(
              (x) => ProductModel.fromJson(x),
            ),
          ),
        );

      default:
        return ListAPIResponseModel(
          status: false,
          result: [],
        );
    }
  }
}
