
import 'package:flutter/material.dart';

class AppointmentModel {
  final String id;
  final String doctorId;
  final String userId;
  final DateTime date;
  final TimeOfDay time;
  final String? notes;
  final AppointmentStatus status;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.date,
    required this.time,
    this.notes,
    this.status = AppointmentStatus.scheduled,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    // Преобразуем строку времени в TimeOfDay
    final timeString = json['time'] as String;
    final timeParts = timeString.split(':');
    final time = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    // Обрабатываем статус (с защитой от null)
    final statusString = json['status'] as String? ?? 'scheduled';
    final status = AppointmentStatus.values.firstWhere(
          (e) => e.toString().split('.').last == statusString,
      orElse: () => AppointmentStatus.scheduled,
    );

    // Основные поля с проверкой типов
    return AppointmentModel(
      id: json['id'] as String,
      doctorId: json['doctorId'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      time: time,
      notes: json['notes'] as String?,
      status: status,
    );
  }

  // Конвертация в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorId': doctorId,
      'userId': userId,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}',
      'notes': notes,
      'status': status.toString().split('.').last,
    };
  }

  // Копирование модели с изменениями
  AppointmentModel copyWith({
    String? id,
    String? doctorId,
    String? userId,
    DateTime? date,
    TimeOfDay? time,
    String? notes,
    AppointmentStatus? status,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      time: time ?? this.time,
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }
}

// Статусы записи
enum AppointmentStatus {
  scheduled,    // запланирована
  completed,    // завершена
  canceled,     // отменена
}
