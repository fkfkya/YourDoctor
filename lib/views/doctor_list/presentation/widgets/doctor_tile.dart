import 'package:flutter/material.dart';
import '../../domain/entities/doctor.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
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
}