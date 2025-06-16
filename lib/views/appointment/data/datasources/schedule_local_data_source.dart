import '../models/schedule_model.dart';

class ScheduleLocalDataSource {
  final List<ScheduleModel> schedulesDb = [
    ScheduleModel(
      doctorId: '32124',
      weeklySlots: {
        'mon': ['10:00', '11:00'],
        'tue': ['12:00'],
        'wed': ['09:00', '10:00'],
      },
    ),
    ScheduleModel(
      doctorId: '67353',
      weeklySlots: {
        'mon': ['11:00'],
        'thu': ['09:00', '10:00'],
      },
    ),
    ScheduleModel(
      doctorId: '12450',
      weeklySlots: {
        'tue': ['14:00', '15:00'],
        'wed': ['13:00'],
        'fri': ['10:00', '11:00'],
      },
    ),
    ScheduleModel(
      doctorId: '67527',
      weeklySlots: {
        'mon': ['08:30', '09:30'],
        'thu': ['11:00'],
      },
    ),
    ScheduleModel(
      doctorId: '96775',
      weeklySlots: {
        'wed': ['14:00', '15:00'],
        'fri': ['09:00'],
      },
    ),
    ScheduleModel(
      doctorId: '72183',
      weeklySlots: {
        'mon': ['10:00', '11:00'],
        'wed': ['13:00'],
      },
    ),
    ScheduleModel(
      doctorId: '25162',
      weeklySlots: {
        'tue': ['09:00'],
        'thu': ['12:00', '13:00'],
      },
    ),
    ScheduleModel(
      doctorId: '39138',
      weeklySlots: {
        'mon': ['10:00', '11:00'],
        'wed': ['11:30', '12:30'],
        'fri': ['13:00'],
      },
    ),
    ScheduleModel(
      doctorId: '89309',
      weeklySlots: {
        'mon': ['10:00'],
        'tue': ['13:00'],
        'thu': ['15:00'],
      },
    ),
    ScheduleModel(
      doctorId: '48274',
      weeklySlots: {
        'tue': ['10:00', '11:00'],
        'wed': ['09:00'],
        'fri': ['14:00'],
      },
    ),
  ];

  Future<ScheduleModel> getScheduleForDoctor(String doctorId) async {
    return schedulesDb.firstWhere(
      (s) => s.doctorId == doctorId,
      orElse: () => throw Exception('Schedule not found'),
    );
  }
}
