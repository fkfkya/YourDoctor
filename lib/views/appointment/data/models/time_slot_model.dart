class TimeSlotModel {
  final DateTime time;
  final bool isAvailable;

  TimeSlotModel({required this.time, required this.isAvailable});

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) {
    return TimeSlotModel(
      time: DateTime.parse(json['time'] as String),
      isAvailable: json['available'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'time': time.toIso8601String(),
    'available': isAvailable,
  };
}