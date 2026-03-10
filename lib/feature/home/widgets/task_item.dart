import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/constants/app_image.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final bool isCompleted;

  const TaskItem({
    super.key,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.title.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(6),
                Text(
                  note,
                  style: AppTextStyles.caption1.copyWith(
                    color: Colors.grey[600],
                    fontSize: 14,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(12),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImage.timeSvg,
                      colorFilter: const ColorFilter.mode(
                        Color(0xff9E92FF),
                        BlendMode.srcIn,
                      ),
                      width: 18,
                      height: 18,
                    ),
                    const Gap(8),
                    Text(
                      '$startTime - $endTime',
                      style: AppTextStyles.caption2.copyWith(
                        color: const Color(0xff9E92FF),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isCompleted
                  ? const Color(0xffEDE8FF)
                  : const Color(0xffFFE9E1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              isCompleted ? 'Done' : 'In Progress',
              style: AppTextStyles.caption2.copyWith(
                color: isCompleted 
                    ? AppColors.primaryColor 
                    : const Color(0xffFF7D53),
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}