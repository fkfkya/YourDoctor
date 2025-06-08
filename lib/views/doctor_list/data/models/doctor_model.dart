class DoctorModel {
  final String id;
  final String name;
  final String specialty;
  final String avatarUrl;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.avatarUrl,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
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
}