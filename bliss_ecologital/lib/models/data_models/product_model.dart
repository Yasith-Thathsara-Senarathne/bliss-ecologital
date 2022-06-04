import 'package:bliss_ecologital/constants/app_enums.dart';
import 'package:bliss_ecologital/utilities/utils.dart';

class ProductModel {
  final String id;
  final String name;
  final Category category;
  final String brand;
  final String model;
  final double price;
  final String colour;
  final String weight;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.brand,
    required this.model,
    required this.price,
    required this.colour,
    required this.weight,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        category: Utils.categoryEnumValue(json["category"]),
        brand: json["brand"],
        model: json["model"],
        price: json["price"].toDouble(),
        colour: json["colour"],
        weight: json["weight"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "brand": brand,
        "model": model,
        "price": price,
        "colour": colour,
        "weight": weight,
        "image": image,
      };

  String get priceToString {
    return price.toStringAsFixed(2);
  }
}
