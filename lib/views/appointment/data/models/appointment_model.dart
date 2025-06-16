import '../models/availability_model.dart';
import '../../domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  AppointmentModel({required super.doctorId, required super.time});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      doctorId: json['doctorId'],
      time: AvailableTime(
        date: DateTime.parse(json['date']),
        time: json['time'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'date': time.date.toIso8601String(),
      'time': time.time,
    };
  }
}