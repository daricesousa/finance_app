import 'package:finance_app/app/app_pages.dart';
import 'package:finance_app/app/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Finance',
      theme: AppTheme.theme,
      getPages: AppPages.pages,
    );
  }
}