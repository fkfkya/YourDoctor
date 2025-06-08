import 'package:equatable/equatable.dart';

abstract class AppointmentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Загрузить расписание
class LoadAvailability extends AppointmentEvent {
  final String doctorId;
  LoadAvailability(this.doctorId);
  @override List<Object?> get props => [doctorId];
}

/// Выбрать временной слот
class SelectTimeSlot extends AppointmentEvent {
  final DateTime time;
  SelectTimeSlot(this.time);
  @override List<Object?> get props => [time];
}

/// Подтвердить запись
class ConfirmBooking extends AppointmentEvent {
  final String doctorId;
  final DateTime time;
  ConfirmBooking({required this.doctorId, required this.time});
  @override List<Object?> get props => [doctorId, time];
}