import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotmatchingsystem/routes/app_pages.dart';
import 'package:spotmatchingsystem/routes/app_routes.dart';
import 'package:spotmatchingsystem/themes/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SMS Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
