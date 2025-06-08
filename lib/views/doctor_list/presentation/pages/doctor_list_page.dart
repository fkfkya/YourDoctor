import 'package:flutter/material.dart';

class DoctorListPage extends StatelessWidget {
  static const routeName = '/doctor_list';
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выбор врача')),
      body: const Center(child: Text('Здесь будет список врачей')),
    );
  }
}
