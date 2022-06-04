import 'package:flutter/material.dart';

class ButtonWithText extends StatelessWidget {
  final String title;

  final Color bgColor;

  final double height;

  final double fontSize;

  final VoidCallback onTapped;

  const ButtonWithText({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.height,
    required this.fontSize,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTapped();
      },
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        fixedSize: Size(
          double.infinity,
          height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
