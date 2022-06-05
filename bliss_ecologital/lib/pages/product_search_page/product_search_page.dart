import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/pages/product_search_page/product_search_controller.dart';
import 'package:bliss_ecologital/widgets/genaric_widgets/product_list_view.dart';
import 'package:bliss_ecologital/widgets/home_widgets/search_text_field.dart';
import 'package:bliss_ecologital/widgets/loading_widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  // varibales
  final _controller = Get.put(ProductSearchController());

  @override
  void initState() {
    _controller.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: const Text(
        'Search',
        style: TextStyle(
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
        left: 18,
        right: 18,
        // bottom: 20,
      ),
      child: Column(
        children: [
          SearchTextField(
            isEnabled: true,
            onTextChange: (value) {
              _controller.onSeachTextChange(value);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => _controller.productSearchLoading.value
                    ? const Center(
                        child: LoadingView(),
                      )
                    : ProductListView(
                        productCategoryList:
                            _controller.productSearchList.value,
                        showRemove: false,
                        onTapped: (value) {
                          _controller.onProductTapped(value);
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }
}
