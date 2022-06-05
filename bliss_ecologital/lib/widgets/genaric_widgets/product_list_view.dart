import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/widgets/genaric_widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  final List<dynamic> productCategoryList;

  final ValueChanged<ProductModel> onTapped;

  final bool showRemove;

  const ProductListView({
    Key? key,
    required this.productCategoryList,
    required this.showRemove,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productCategoryList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final _productModel = productCategoryList[index] as ProductModel;
        return InkWell(
          onTap: () {
            onTapped(_productModel);
          },
          child: ProductListTile(
            productModel: _productModel,
            showRemove: showRemove,
          ),
        );
      },
    );
  }
}
