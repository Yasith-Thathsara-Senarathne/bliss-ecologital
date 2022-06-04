import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:bliss_ecologital/pages/product_page/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryPage extends StatefulWidget {
  const ProductCategoryPage({Key? key}) : super(key: key);

  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  // varibales
  final _controller = Get.put(ProductController());

  final _categoryUIModel = Get.arguments as CategoryUIModel;

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: Text(
        _categoryUIModel.categoryName,
        style: const TextStyle(
          color: AppColors.pacificBlue,
          fontSize: AppFontSizes.title,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      foregroundColor: AppColors.pacificBlue,
    );
    return Scaffold(
      appBar: _appBar,
    );
  }
}
