import 'package:flutter/material.dart';
import 'package:your_doctor/injection.dart';
import 'package:your_doctor/routes/app_router.dart';
import 'package:your_doctor/shared/themes/app_theme.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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