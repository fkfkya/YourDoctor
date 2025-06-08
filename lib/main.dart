import 'package:flutter/material.dart';
import 'package:your_doctor/injection.dart';
import 'package:your_doctor/routes/app_router.dart';
import 'package:your_doctor/shared/themes/app_theme.dart';

void main() {
  init();
  runApp(const YourDoctorApp());
}

class YourDoctorApp extends StatelessWidget {
  const YourDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourDoctor',
      theme: AppTheme.light,
      onGenerateRoute: AppRouter.generate,
      initialRoute: '/doctor_list',
    );
  }
}