import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int cartCount;

  final VoidCallback onTapped;

  const CartButton({
    Key? key,
    required this.cartCount,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: () {
            onTapped();
          },
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 30,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.torchRed,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              cartCount.toString(),
            ),
          ),
        )
      ],
    );
  }
}
