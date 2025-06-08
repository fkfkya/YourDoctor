import 'package:equatable/equatable.dart';

abstract class AppointmentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppointmentInitial extends AppointmentState {}
class AppointmentLoading extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final List<DateTime> availableTimes;
  final DateTime? selectedTime;

  AppointmentLoaded({required this.availableTimes, this.selectedTime});
  @override List<Object?> get props => [availableTimes, selectedTime];
}

class AppointmentBooking extends AppointmentState {}
class AppointmentBooked extends AppointmentState {}

class AppointmentError extends AppointmentState {
  final String message;
  AppointmentError(this.message);
  @override List<Object?> get props => [message];
}