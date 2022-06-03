import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final bool isEnabled;

  const SearchTextField({
    Key? key,
    this.isEnabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.only(
          top: 2,
          left: 30,
          right: 6,
          bottom: 2,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.nevada.withOpacity(0.3),
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: TextField(
          cursorColor: AppColors.nevada.withOpacity(0.4),
          decoration: InputDecoration(
            hintText: AppTexts.searchYourModelNormal,
            hintStyle: TextStyle(
              color: AppColors.nevada.withOpacity(0.4),
              decoration: TextDecoration.none,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabled: isEnabled,
            suffixIcon: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 5,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.pacificBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
