import 'package:flutter/material.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 60,
    required this.onPress,
    this.background = AppColors.primaryColor,
    this.textStyle,
  });

  final String text;
  final double width;
  final double height;
  final Function () onPress;
  final Color background;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: Size(width, height),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: textStyle?? AppTextStyles.title.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
