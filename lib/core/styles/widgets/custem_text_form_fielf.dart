import 'package:flutter/material.dart';
import 'package:taskati_app/core/styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffix,
    this.prefix,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.enabled = true,
    this.onTap,
    this.onChaged, 
    this.controller,
  });

  final String? hintText;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final Function()? onTap;
  final Function(String)? onChaged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentColor.withValues(alpha: 0.1),
            blurRadius: 6,
            spreadRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          prefix: prefix,
          suffix: suffix,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        onTap: onTap,
        onChanged: onChaged,
      ),
    );
  }
}
