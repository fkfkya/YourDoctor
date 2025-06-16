import '../../data/models/availability_model.dart';
import '../../data/datasources/schedule_local_data_source.dart';

class GetAvailableTimes {
  final ScheduleLocalDataSource dataSource;

  GetAvailableTimes(this.dataSource);

  Future<List<AvailableTime>> call(String doctorId) async {
    final schedule = await dataSource.getScheduleForDoctor(doctorId);

    final now = DateTime.now();
    final next7Days = List.generate(7, (i) => now.add(Duration(days: i)));

    final List<AvailableTime> result = [];

    for (final date in next7Days) {
      final weekday = _weekdayToString(date.weekday);
      final slots = schedule.weeklySlots[weekday] ?? [];
      for (final time in slots) {
        result.add(AvailableTime(date: date, time: time));
      }
    }

    return result;
  }

  String _weekdayToString(int weekday) =>
    ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'][weekday - 1];
}
