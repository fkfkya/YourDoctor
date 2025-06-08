import 'package:flutter/material.dart';
import '../../domain/entities/user_appointment.dart';

class AppointmentCard extends StatelessWidget {
  final UserAppointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final time = appointment.time;
    final formatted =
      '${time.day.toString().padLeft(2, '0')}.'
      '${time.month.toString().padLeft(2, '0')} '  
      '${time.hour.toString().padLeft(2, '0')}:''${time.minute.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text('Доктор: ${appointment.doctorName}'),
        subtitle: Text('Время: $formatted'),
      ),
    );
  }
}