import '../../domain/entities/doctor.dart';

class DoctorModel {
  final String id;
  final String name;
  final String specialty;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
  });

  factory DoctorModel.fromJson(Map<String, String> json) {
    return DoctorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
    );
  }

  Map<String, String> toJson() => {
    'id': id,
    'name': name,
    'specialty': specialty,
  };

  // Преобразование в Domain Entity
  Doctor toEntity() {
    return Doctor(
      id: id,
      name: name,
      specialty: specialty,
    );
  }
  // Копирование модели с изменениями
  DoctorModel copyWith({
    String? id,
    String? name,
    String? specialty,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
    );
  }
}