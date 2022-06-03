import 'dart:convert';

import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/models/network_models/list_api_response_model.dart';
import 'package:bliss_ecologital/services/api_paths.dart';
import 'package:http/http.dart' as http;

abstract class RemoteServices {
  static var client = http.Client();

  static const headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static const timeOut = Duration(seconds: 30);

  // fetch products
  static Future<List<ProductModel>> fetchProducts() async {
    try {
      final productURL = Uri.https(
        APIPath.baseAuthority,
        APIPath.products,
      );

      final response = await client
          .get(
            productURL,
            headers: headers,
          )
          .timeout(
            timeOut,
          );

      if (response.statusCode != 200) {
        return [];
      }

      final jsonString = response.body;
      final apiResponse = ListAPIResponseModel<ProductModel>()
          .convertToGenaricModelType(jsonString);
      return apiResponse.result!.isNotEmpty
          ? apiResponse.result as List<ProductModel>
          : [];
    } catch (exception) {
      return [];
    }
  }
}
