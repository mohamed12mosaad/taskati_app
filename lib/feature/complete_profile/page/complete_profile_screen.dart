import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/constants/app_image.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';
import 'package:taskati_app/core/styles/widgets/custem_text_form_fielf.dart';
import 'package:taskati_app/core/styles/widgets/custome_svg_picture.dart';
import 'package:taskati_app/core/styles/widgets/dialogs.dart';
import 'package:taskati_app/core/styles/widgets/main_button.dart';
import 'package:taskati_app/core/styles/widgets/tab_button.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String? path;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Complete Your Profile'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Gap(86),
              Row(
                children: [
                  Text(
                    'Profile Image',
                    style: AppTextStyles.caption2.copyWith(
                      color: AppColors.seconderyColor,
                    ),
                  ),
                ],
              ),
              Gap(21),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 82,
                    backgroundImage: path != null
                        ? FileImage(File(path!))
                        : AssetImage(AppImage.user),
                  ),
                  if (path != null)
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   path = null;
                          // });
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog.adaptive(
                              title: const Text('Delete Image'),
                              content: const Text(
                                'Are you sure you want to delete',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      path = null;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.whiteColor,
                          child: CustomSvgPicture(
                            path: AppImage.deleteSvg,
                            color: AppColors.redColor,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Gap(34),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: 'From Camera',
                    onPress: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    },
                  ),
                  Gap(12),
                  TabButton(
                    text: 'From Gallery',
                    onPress: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    },
                  ),
                ],
              ),
              Gap(45),
              Row(
                children: [
                  Text(
                    'Your Name',
                    style: AppTextStyles.caption2.copyWith(
                      color: AppColors.seconderyColor,
                    ),
                  ),
                ],
              ),
              Gap(8),
              CustomTextFormField(controller: controller),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 30),
        child: MainButton(
          text: "Let's Start !",
          onPress: () {
            if (path != null && controller.text.isNotEmpty) {
              // navigate to next screen
            } else if (path == null && controller.text.isNotEmpty) {
              showErrorDialog(context, 'Select profile image');
            } else if (path != null && controller.text.isEmpty) {
              showErrorDialog(context, 'Enter your name');
            } else {
              showErrorDialog(
                context,
                'Select profile image and Enter your name',
              );
            }
          },
        ),
      ),
    );
  }
}
