import '../models/availability_model.dart';
import 'package:your_doctor/views/doctor_list/data/datasources/schedules_db.dart';
import 'package:intl/intl.dart';
import 'package:pair/pair.dart';
import '../../../doctor_list/data/models/schedule.dart';

final Map<String, List<AvailableTime>> scheduleDb = {};

extension ScheduleGetByDay on Schedule {
  Pair<int, int>? getByDay(String weekday) {
    switch (weekday) {
      case 'mon': return mon;
      case 'tue': return tue;
      case 'wed': return wed;
      case 'thu': return thu;
      case 'fri': return fri;
      case 'sat': return sar;
      case 'sun': return sun;
      default: return null;
    }
  }
}

void generateScheduleDb() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  for (final schedule in schedulesDb) {
    final doctorId = schedule.doctor_id;
    final times = <AvailableTime>[];

    for (int offset = 0; offset < 7; offset++) {
      final date = today.add(Duration(days: offset));
      final weekday = DateFormat('E', 'en_US').format(date).toLowerCase();
      final hours = schedule.getByDay(weekday);
      if (hours != null) {
        for (int h = hours.key; h < hours.value; h++) {
          times.add(AvailableTime(date: date, time: '${h.toString().padLeft(2, '0')}:00'));
          times.add(AvailableTime(date: date, time: '${h.toString().padLeft(2, '0')}:30'));
        }
      }
    }

    scheduleDb[doctorId] = times;
  }
}

abstract class AppointmentRemoteDataSource {
  Future<List<AvailableTime>> fetchAvailableTimes(String doctorId);
  Future<void> sendBooking(String doctorId, AvailableTime time);
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  @override
  Future<List<AvailableTime>> fetchAvailableTimes(String doctorId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return scheduleDb[doctorId] ?? [];
  }

  @override
  Future<void> sendBooking(String doctorId, AvailableTime time) async {
    await Future.delayed(const Duration(milliseconds: 300));
    scheduleDb[doctorId]?.removeWhere(
      (t) => t.date.year == time.date.year &&
             t.date.month == time.date.month &&
             t.date.day == time.date.day &&
             t.time == time.time,
    );
  }
}
