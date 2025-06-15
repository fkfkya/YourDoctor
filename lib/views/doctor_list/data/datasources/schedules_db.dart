import 'package:your_doctor/views/doctor_list/data/models/schedule.dart';
import 'package:pair/pair.dart';

List<Schedule> schedules_db = [
  Schedule(
    doctor_id: '32124',
    mon: Pair<int, int>(8, 19),
    tue: Pair<int, int>(8, 19),
    wed: Pair<int, int>(8, 19),
    thu: Pair<int, int>(8, 19),
    fri: Pair<int, int>(8, 15),
  ),
  Schedule(
    doctor_id: '67353',
    mon: Pair<int, int>(10, 20),
    thu: Pair<int, int>(10, 20),
  ),
  Schedule(
    doctor_id: '12450',
    mon: Pair<int, int>(8, 17),
    tue: Pair<int, int>(8, 17),
    wed: Pair<int, int>(8, 17),
  ),
  Schedule(
    doctor_id: '67527',
    thu: Pair<int, int>(11, 20),
    fri: Pair<int, int>(11, 20),
    sar: Pair<int, int>(11, 16),
  ),
  Schedule(
    doctor_id: '96775',
    mon: Pair<int, int>(8, 18),
    tue: Pair<int, int>(8, 18),
    wed: Pair<int, int>(8, 18),
    thu: Pair<int, int>(8, 18),
  ),
  Schedule(
    doctor_id: '72183',
    fri: Pair<int, int>(15, 19),
    sar: Pair<int, int>(8, 19),
    sun: Pair<int, int>(8, 19),
  ),
  Schedule(
    doctor_id: '25162',
    mon: Pair<int, int>(12, 17),
    tue: Pair<int, int>(9, 15),
  ),
  Schedule(
    doctor_id: '39138',
    thu: Pair<int, int>(8, 17),
    fri: Pair<int, int>(8, 17),
  ),
  Schedule(
    doctor_id: '89309',
    wed: Pair<int, int>(9, 19),
  ),
  Schedule(
    doctor_id: '48274',
    tue: Pair<int, int>(10, 19),
    thu: Pair<int, int>(10, 19),
    sar: Pair<int, int>(10, 19),
  ),
];