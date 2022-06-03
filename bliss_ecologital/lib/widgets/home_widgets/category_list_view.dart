import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/models/ui_models/category_ui_model.dart';
import 'package:bliss_ecologital/widgets/home_widgets/catregory_list_tile.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List<dynamic> categoryList;

  final ValueChanged<CategoryUIModel> onTapped;

  const CategoryListView({
    Key? key,
    required this.categoryList,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        final _categoryUIModel = categoryList[index] as CategoryUIModel;

        return Padding(
          padding: const EdgeInsets.only(left: 18),
          child: InkWell(
            onTap: () {
              onTapped(_categoryUIModel);
            },
            child: CategoryListTile(
              categoryUIModel: _categoryUIModel,
            ),
          ),
        );
      },
    );
  }
}
