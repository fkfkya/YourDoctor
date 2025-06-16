import 'package:pair/pair.dart';

class Schedule {
  final String doctor_id;
  final Pair<int, int>? mon;
  final Pair<int, int>? tue;
  final Pair<int, int>? wed;
  final Pair<int, int>? thu;
  final Pair<int, int>? fri;
  final Pair<int, int>? sar;
  final Pair<int, int>? sun;

  Schedule({
    required this.doctor_id,
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sar,
    this.sun,
  });
}
