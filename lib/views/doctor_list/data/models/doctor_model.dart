class DoctorModel {
  final String id;
  final String fullName;
  final String occupation;
  final Map<String, List<String>> schedule;

  DoctorModel({
    required this.id,
    required this.fullName,
    required this.occupation,
    required this.schedule,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      fullName: json['fullName'],
      occupation: json['occupation'],
      schedule: Map<String, List<String>>.from(json['schedule']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'occupation': occupation,
      'schedule': schedule,
    };
  }
}