import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:bliss_ecologital/pages/product_category_page/product_category_controller.dart';
import 'package:bliss_ecologital/widgets/genaric_widgets/product_list_view.dart';
import 'package:bliss_ecologital/widgets/loading_widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryPage extends StatefulWidget {
  const ProductCategoryPage({Key? key}) : super(key: key);

  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  // varibales
  final _controller = Get.put(ProductCategoryController());

  final _categoryUIModel = Get.arguments as CategoryUIModel;

  @override
  void initState() {
    _controller.loadData();
    super.initState();
  }

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

    final _body = Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 18,
        right: 18,
        // bottom: 20,
      ),
      child: SingleChildScrollView(
        child: Obx(
          () => _controller.productCategoryLoading.value
              ? const Center(
                  child: LoadingView(),
                )
              : ProductListView(
                  productCategoryList: _controller.productCategoryList.value,
                  showRemove: false,
                  onTapped: (value) {
                    _controller.onProductTapped(value);
                  },
                ),
        ),
      ),
    );

    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }
}
