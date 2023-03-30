import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
      primaryColor: AppColor.primary,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
      useMaterial3: true,
      textTheme: const TextTheme(
          headlineSmall:
              TextStyle(color: AppColor.dark, fontWeight: FontWeight.w300)));
}
