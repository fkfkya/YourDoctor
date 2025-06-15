import '../../domain/entities/user_appointment.dart';

class UserAppointmentModel {
  final String appointment_id;
  final String doctor_id;
  final DateTime time;

  UserAppointmentModel({
    required this.appointment_id,
    required this.doctor_id,
    required this.time,
  });

  factory UserAppointmentModel.fromJson(Map<String, dynamic> json) {
    return UserAppointmentModel(
      appointment_id: json['appointment_id'] as String,
      doctor_id: json['doctor_id'] as String,
      time: DateTime.parse(json['time'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'appointment_id': appointment_id,
    'doctor_id': doctor_id,
    'time': time.toIso8601String(),
  };
}