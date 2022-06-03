import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:bliss_ecologital/widgets/home_widgets/catregory_list_tile.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List<dynamic> categoryList;

  const CategoryListView({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final _categoryUIModel = categoryList[index] as CategoryUIModel;

          return CategoryListTile(
            categoryUIModel: _categoryUIModel,
          );
        },
      ),
    );
  }
}
