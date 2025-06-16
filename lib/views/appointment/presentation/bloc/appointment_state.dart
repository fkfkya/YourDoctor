import 'package:equatable/equatable.dart';
import '../../data/models/availability_model.dart';

abstract class AppointmentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppointmentInitial extends AppointmentState {}
class AppointmentLoading extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final List<AvailableTime> availableTimes;
  final DateTime? selectedDate;
  final AvailableTime? selectedTime;

  AppointmentLoaded({
    required this.availableTimes,
    this.selectedDate,
    this.selectedTime,
  });

  AppointmentLoaded copyWith({
    List<AvailableTime>? availableTimes,
    DateTime? selectedDate,
    AvailableTime? selectedTime,
  }) {
    return AppointmentLoaded(
      availableTimes: availableTimes ?? this.availableTimes,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }

  @override
  List<Object?> get props => [availableTimes, selectedDate, selectedTime];
}

class AppointmentBooking extends AppointmentState {}
class AppointmentBooked extends AppointmentState {}

class AppointmentError extends AppointmentState {
  final String message;
  AppointmentError(this.message);
  @override
  List<Object?> get props => [message];
}