import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:bliss_ecologital/widgets/genaric_widgets/button_with_text.dart';
import 'package:flutter/material.dart';

class CheckoutTotalView extends StatelessWidget {
  final double total;

  const CheckoutTotalView({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.pacificBlue,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppTexts.totalNormal,
                  style: TextStyle(
                    color: AppColors.nevada,
                    fontSize: AppFontSizes.largeTitle,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Rs. ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: AppColors.nevada,
                    fontSize: AppFontSizes.largeTitle,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ButtonWithText(
            title: AppTexts.checkoutNormal,
            bgColor: AppColors.pacificBlue,
            height: 50,
            fontSize: AppFontSizes.title,
            onTapped: () {},
          ),
        ),
      ],
    );
  }
}
