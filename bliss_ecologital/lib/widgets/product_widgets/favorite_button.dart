import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isAddedToFavorites;

  final VoidCallback onTapped;

  const FavoriteButton({
    Key? key,
    required this.isAddedToFavorites,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapped();
      },
      child: Icon(
        Icons.favorite,
        color: isAddedToFavorites ? AppColors.torchRed : Colors.white,
        size: 30,
      ),
    );
  }
}
