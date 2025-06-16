import '../models/schedule_model.dart';

class ScheduleLocalDataSource {
  final List<ScheduleModel> schedulesDb = [
    ScheduleModel(
      doctorId: '32124',
      weeklySlots: _workWeek(['mon', 'tue', 'wed', 'thu', 'fri']),
    ),
    ScheduleModel(
      doctorId: '67353',
      weeklySlots: _workWeek(['mon', 'wed', 'thu', 'fri']),
    ),
    ScheduleModel(
      doctorId: '12450',
      weeklySlots: _workWeek(['mon', 'tue', 'thu']),
    ),
    ScheduleModel(
      doctorId: '67527',
      weeklySlots: _workWeek(['tue', 'wed', 'thu', 'fri']),
    ),
    ScheduleModel(
      doctorId: '96775',
      weeklySlots: _workWeek(['mon', 'wed', 'thu', 'fri']),
    ),
    ScheduleModel(
      doctorId: '72183',
      weeklySlots: _workWeek(['mon', 'tue', 'wed', 'thu']),
    ),
    ScheduleModel(
      doctorId: '25162',
      weeklySlots: _workWeek(['mon', 'tue', 'thu', 'fri']),
    ),
    ScheduleModel(
      doctorId: '39138',
      weeklySlots: _workWeek(['mon', 'tue', 'wed', 'thu', 'fri']),
    ),
    ScheduleModel(
      doctorId: '89309',
      weeklySlots: _workWeek(['mon', 'tue', 'wed', 'thu']),
    ),
    ScheduleModel(
      doctorId: '48274',
      weeklySlots: _workWeek(['mon', 'tue', 'wed', 'thu', 'fri']),
    ),
  ];

  Future<ScheduleModel> getScheduleForDoctor(String doctorId) async {
    return schedulesDb.firstWhere(
      (s) => s.doctorId == doctorId,
      orElse: () => throw Exception('Schedule not found'),
    );
  }
}

// 🔧 Хелпер-метод для генерации рабочих слотов каждые 30 минут с 9:00 до 16:00
Map<String, List<String>> _workWeek(List<String> days) {
  final List<String> slots = [];
  for (int h = 9; h <= 16; h++) {
    slots.add('${h.toString().padLeft(2, '0')}:00');
    if (h < 16) {
      slots.add('${h.toString().padLeft(2, '0')}:30');
    }
  }

  return {
    for (final day in days) day: List<String>.from(slots),
  };
}
