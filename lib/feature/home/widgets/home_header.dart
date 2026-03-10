import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati_app/core/constants/app_image.dart';
import 'package:taskati_app/core/services/shared_pref.dart';
import 'package:taskati_app/core/styles/text_style.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String name = '';
  String path = '';
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    name =  SharedPref.getString(SharedPref.namekey);
    path =  SharedPref.getString(SharedPref.imagekey);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: path.isEmpty
            ? Image.asset(AppImage.user, height: 55, width: 55)
            : Image.file(File(path), height: 55, width: 55, fit: BoxFit.cover),
      ),
      title: Text('Hello!', style: AppTextStyles.caption1),
      subtitle: Text(name, style: AppTextStyles.title),
    );
  }
}
