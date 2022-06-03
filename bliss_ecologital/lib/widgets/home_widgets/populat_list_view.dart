import 'package:bliss_ecologital/models/data_models/product_model.dart';
import 'package:bliss_ecologital/widgets/home_widgets/popular_list_tile.dart';
import 'package:flutter/material.dart';

class PopularListView extends StatelessWidget {
  final List<dynamic> productList;

  final ValueChanged<ProductModel> onTapped;

  const PopularListView({
    Key? key,
    required this.productList,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final _productModel = productList[index] as ProductModel;

        return Padding(
          padding: const EdgeInsets.only(left: 18),
          child: InkWell(
            onTap: () {
              onTapped(_productModel);
            },
            child: PopularListTile(
              productModel: _productModel,
            ),
          ),
        );
      },
    );
  }
}
