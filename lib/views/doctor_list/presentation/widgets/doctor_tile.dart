import 'package:flutter/material.dart';
<<<<<<< HEAD
=======

>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
import '../../domain/entities/doctor.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(doctor.avatarUrl),
      ),
      title: Text(doctor.name),
      subtitle: Text(doctor.specialty),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/appointment',
          arguments: doctor.id,
        );
      },
    );
}
=======
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
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
}