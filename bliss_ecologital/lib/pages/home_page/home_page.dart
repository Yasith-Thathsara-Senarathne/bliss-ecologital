import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/constants/app_font_sizes.dart';
import 'package:bliss_ecologital/constants/app_texts.dart';
import 'package:bliss_ecologital/widgets/home_widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _body = Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 18,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppTexts.helloNormal,
              style: TextStyle(
                color: AppColors.nevada.withOpacity(0.6),
                fontSize: AppFontSizes.smallTitle,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              AppTexts.userNameNormal,
              style: TextStyle(
                color: AppColors.nevada,
                fontSize: AppFontSizes.title,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.nevada.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const TextField(),
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
