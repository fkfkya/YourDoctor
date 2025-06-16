import '../../data/models/availability_model.dart';

class Appointment {
  final String doctorId;
  final AvailableTime time;

  Appointment({required this.doctorId, required this.time});
}