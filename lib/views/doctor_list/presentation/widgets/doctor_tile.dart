import 'package:flutter/material.dart';

import '../../domain/entities/doctor.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(doctor.occupation),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctor.fullName),
            const SizedBox(height: 4),
            Text(
              'Расписание: ${doctor.schedule.keys.join(', ')}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Навигация к экрану записи
        },
      ),
    );
  }
}