import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  final CategoryUIModel categoryUIModel;

  const CategoryListTile({
    Key? key,
    required this.categoryUIModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: categoryUIModel.categoryBGColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            categoryUIModel.categoryIcon,
            color: Colors.white,
            width: 35,
            height: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            categoryUIModel.categoryName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppFontSizes.smallTitle,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
