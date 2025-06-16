import 'package:equatable/equatable.dart';

class AvailableTime extends Equatable {
  final DateTime date;
  final String time;

  const AvailableTime({
    required this.date,
    required this.time,
  });

  @override
  List<Object?> get props => [date, time];
}