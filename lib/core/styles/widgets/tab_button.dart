import 'package:flutter/material.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.text,
    this.width = 50,
    this.height = 35,
    required this.onPress,
    this.background = AppColors.accentColor,
    this.textStyle,
  });

  final String text;
  final double width;
  final double height;
  final Function() onPress;
  final Color background;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        minimumSize: Size(width, height),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style:
            textStyle ??
            AppTextStyles.caption1.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
