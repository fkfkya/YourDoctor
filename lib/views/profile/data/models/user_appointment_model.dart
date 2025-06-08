import '../../domain/entities/user_appointment.dart';

/// Модель записи пользователя
class UserAppointmentModel {
  final String appointmentId;
  final String doctorName;
  final DateTime time;

  UserAppointmentModel({
    required this.appointmentId,
    required this.doctorName,
    required this.time,
  });

  factory UserAppointmentModel.fromJson(Map<String, dynamic> json) {
    return UserAppointmentModel(
      appointmentId: json['appointmentId'] as String,
      doctorName: json['doctorName'] as String,
      time: DateTime.parse(json['time'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'appointmentId': appointmentId,
    'doctorName': doctorName,
    'time': time.toIso8601String(),
  };
}