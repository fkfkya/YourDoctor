import 'package:flutter/material.dart';
import 'package:your_doctor/views/doctor_list/data/models/doctor_model.dart';
import '../../domain/entities/user_appointment.dart';
import '../../../doctor_list/data/datasources/doctors_db.dart';

class AppointmentCard extends StatelessWidget {
  final UserAppointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    DoctorModel doctor = doctors_db.firstWhere((doctor) => doctor.id == appointment.doctor_id);

    final time = appointment.time;
    final formatted =
      '${time.day.toString().padLeft(2, '0')}.'
      '${time.month.toString().padLeft(2, '0')} '  
      '${time.hour.toString().padLeft(2, '0')}:''${time.minute.toString().padLeft(2, '0')}';

    return Card(
      color: time.isAfter(DateTime.now()) ? Color(0xffd1edc0) : Color(0xeef5f9fa),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: doctor.specialty,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' ${doctor.name}'),
            ],
          ),
        ),
        subtitle: Text('Время: $formatted'),
      ),
    );
  }
}