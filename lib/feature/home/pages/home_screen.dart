import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';
import 'package:taskati_app/feature/home/widgets/home_header.dart';
import 'package:taskati_app/feature/home/widgets/task_item.dart';
import 'package:taskati_app/feature/home/widgets/tody_progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatePickerController controller = DatePickerController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      controller.animateToSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                HomeHeader(),
                Gap(24),
                TodyProgress(),
                Gap(30),
                DatePicker(
                  DateTime.now().subtract(Duration(days: 10)),
                  height: 90,
                  initialSelectedDate: DateTime.now(),
                  controller: controller,
                  selectionColor: AppColors.primaryColor,
                  selectedTextColor: Colors.white,
                  dateTextStyle: AppTextStyles.title.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  monthTextStyle: AppTextStyles.caption2,
                  dayTextStyle: AppTextStyles.caption2,
                  onDateChange: (date) {},
                ),
                Gap(32),
                ButtonsTabBar(
                  backgroundColor: AppColors.primaryColor,
                  borderWidth: 2,
                  borderColor: Colors.black,
                  unselectedBackgroundColor: AppColors.accentColor,
                  labelStyle: AppTextStyles.caption1.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: AppTextStyles.caption1.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  contentCenter: true,
                  radius: 15,
                  buttonMargin: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  width: (MediaQuery.sizeOf(context).width - 40) / 3,
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'In Progress'),
                    Tab(text: 'Completed'),
                  ],
                ),
                Gap(32),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: 3,
                        separatorBuilder: (context, index) => const Gap(15),
                        itemBuilder: (context, index) {
                          return  TaskItem(
                            title: 'Market Research',
                            note:
                                'Grocery shopping app design Grocery shopping app design',
                            startTime: '10:00 AM',
                            endTime: '12:00 PM',
                            isCompleted: index == 2 ? false : true,
                          );
                        },
                      ),
                      // in progress
                      ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: 3,
                        separatorBuilder: (context, index) => const Gap(15),
                        itemBuilder: (context, index) {
                          return  TaskItem(
                            title: 'Market Research',
                            note:
                                'Grocery shopping app design Grocery shopping app design',
                            startTime: '10:00 AM',
                            endTime: '12:00 PM',
                            isCompleted: index == 2 ? false : true,
                          );
                        },
                      ),
                      // completed
                      ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: 3,
                        separatorBuilder: (context, index) => const Gap(15),
                        itemBuilder: (context, index) {
                          return  TaskItem(
                            title: 'Market Research',
                            note:
                                'Grocery shopping app design Grocery shopping app design',
                            startTime: '10:00 AM',
                            endTime: '12:00 PM',
                            isCompleted: index == 2 ? false : true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
