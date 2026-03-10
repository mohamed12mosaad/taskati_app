import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';

class TodyProgress extends StatelessWidget {
  const TodyProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.MMMEd().format(DateTime.now()),
                  style: AppTextStyles.caption1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                Gap(13),
                Text(
                  'Your today’s task almost\n done!',
                  style: AppTextStyles.caption1.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Gap(33),
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                color: AppColors.whiteColor,
                backgroundColor: Color(0xff8764FF),
                value: 0.85,
                strokeWidth: 9,
                strokeCap: StrokeCap.round,
                constraints: BoxConstraints(
                  minHeight: 76,
                  minWidth: 76,
                  maxWidth: 76,
                  maxHeight: 76,
                ),
              ),
              Text(
                '85%',
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
