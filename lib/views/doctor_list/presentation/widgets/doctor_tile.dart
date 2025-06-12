import 'package:flutter/material.dart';
import '../../domain/entities/doctor.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xfff5f9fa),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(doctor.specialty),
        subtitle: Text(doctor.name),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/appointment',
            arguments: doctor.id,
          );
        },
      ),
    );
  }
}