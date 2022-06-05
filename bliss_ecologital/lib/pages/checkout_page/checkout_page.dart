import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:bliss_ecologital/pages/checkout_page/checkout_controller.dart';
import 'package:bliss_ecologital/widgets/checkout_widgets/checkout_total_view.dart';
import 'package:bliss_ecologital/widgets/genaric_widgets/button_with_text.dart';
import 'package:bliss_ecologital/widgets/genaric_widgets/product_list_view.dart';
import 'package:bliss_ecologital/widgets/loading_widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // varibales
  final _controller = Get.put(CheckoutController());

  @override
  void initState() {
    _controller.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: const Text(
        AppTexts.checkoutNormal,
        style: TextStyle(
          color: AppColors.pacificBlue,
          fontSize: AppFontSizes.title,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      foregroundColor: AppColors.pacificBlue,
    );

    final _body = Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: Get.height * 0.3,
          ),
          child: SingleChildScrollView(
            child: Obx(
              () => _controller.cartLoading.value
                  ? const Center(
                      child: LoadingView(),
                    )
                  : ProductListView(
                      productCategoryList: _controller.cartList.value,
                      showRemove: true,
                      onTapped: (value) {
                        _controller.handleOnProductRemove(value);
                      },
                    ),
            ),
          ),
        ),
        Positioned(
          left: 18,
          right: 18,
          bottom: 0,
          child: SizedBox(
            height: Get.height * 0.3,
            child: Obx(
              () => CheckoutTotalView(
                total: _controller.total.value,
              ),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }
}
