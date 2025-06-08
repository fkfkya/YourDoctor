import '../entities/doctor.dart';

/// Абстракция репозитория врачей
abstract class DoctorRepository {
  Future<List<Doctor>> getAvailableDoctors();
}