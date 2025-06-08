import '../../domain/entities/doctor.dart';
/// Модель врача для data-слоя
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

  factory DoctorModel.fromJson(Map<String, String> json) {
    return DoctorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
  }

  Map<String, String> toJson() => {
    'id': id,
    'name': name,
    'specialty': specialty,
    'avatarUrl': avatarUrl,
  };

  // Преобразование в Domain Entity
  Doctor toEntity() {
    return Doctor(
      id: id,
      name: name,
      specialty: specialty,
      avatarUrl: avatarUrl,
    );
  }
  // Копирование модели с изменениями
  DoctorModel copyWith({
    String? id,
    String? name,
    String? specialty,
    String? avatarUrl,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}