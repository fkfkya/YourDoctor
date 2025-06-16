import 'package:equatable/equatable.dart';
import '../../data/models/availability_model.dart';

abstract class AppointmentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAvailability extends AppointmentEvent {
  final String doctorId;
  LoadAvailability(this.doctorId);
  @override
  List<Object?> get props => [doctorId];
}

class SelectDate extends AppointmentEvent {
  final DateTime date;
  SelectDate(this.date);
  @override
  List<Object?> get props => [date];
}

class SelectTime extends AppointmentEvent {
  final AvailableTime time;
  SelectTime(this.time);
  @override
  List<Object?> get props => [time];
}

class ConfirmAppointment extends AppointmentEvent {
  final String doctorId;
  final AvailableTime selectedTime;
  ConfirmAppointment({required this.doctorId, required this.selectedTime});
  @override
  List<Object?> get props => [doctorId, selectedTime];
}