import 'time_slot_model.dart';

class AvailabilityModel {
  final String doctorId;
  final List<TimeSlotModel> slots;

  AvailabilityModel({required this.doctorId, required this.slots});

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      doctorId: json['doctorId'] as String,
      slots: (json['slots'] as List)
          .map((e) => TimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'doctorId': doctorId,
    'slots': slots.map((s) => s.toJson()).toList(),
  };
}