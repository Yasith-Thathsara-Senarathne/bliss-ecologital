import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:bliss_ecologital/pages/home_page/home_controller.dart';
import 'package:bliss_ecologital/widgets/home_widgets/category_list_view.dart';
import 'package:bliss_ecologital/widgets/home_widgets/home_app_bar.dart';
import 'package:bliss_ecologital/widgets/home_widgets/populat_list_view.dart';
import 'package:bliss_ecologital/widgets/home_widgets/search_text_field.dart';
import 'package:bliss_ecologital/widgets/loading_widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final _body = Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                AppTexts.helloNormal,
                style: TextStyle(
                  color: AppColors.nevada.withOpacity(0.6),
                  fontSize: AppFontSizes.smallTitle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                AppTexts.userNameNormal,
                style: TextStyle(
                  color: AppColors.nevada,
                  fontSize: AppFontSizes.title,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SearchTextField(),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    AppTexts.byCategoryNormal,
                    style: TextStyle(
                      color: AppColors.nevada,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => _controller.categoryLoading.value
                      ? const LoadingView()
                      : SizedBox(
                          // this is to define a height for the category carousal
                          height: Get.width * 0.17,
                          child: CategoryListView(
                            categoryList: _controller.categoryList.value,
                            onTapped: (value) {
                              print('implement category on tapped.');
                            },
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    AppTexts.mostPopularNormal,
                    style: TextStyle(
                      color: AppColors.nevada,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => _controller.productLoading.value
                      ? const LoadingView()
                      : SizedBox(
                          // this is to define a height for the category carousal
                          height: Get.width * 0.6,
                          child: PopularListView(
                            productList: _controller.productList.value,
                            onTapped: (value) {
                              _controller.onProductTapped(value);
                            },
                          ),
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: const HomeAppBar(),
      body: _body,
    );
  }
}
