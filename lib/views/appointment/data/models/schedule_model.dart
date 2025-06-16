class ScheduleModel {
  final String doctorId;
  final Map<String, List<String>> weeklySlots;

  ScheduleModel({
    required this.doctorId,
    required this.weeklySlots,
  });
}
