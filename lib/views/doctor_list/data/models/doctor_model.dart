class DoctorModel {
  final String id;
<<<<<<< HEAD
  final String name;
  final String specialty;
  final String avatarUrl;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.avatarUrl,
=======
  final String fullName;
  final String occupation;
  final Map<String, List<String>> schedule;

  DoctorModel({
    required this.id,
    required this.fullName,
    required this.occupation,
    required this.schedule,
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
<<<<<<< HEAD
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'specialty': specialty,
    'avatarUrl': avatarUrl,
  };
=======
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
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
}