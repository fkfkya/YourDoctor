import '../models/doctor_model.dart';

/// Источник данных для списка врачей
abstract class DoctorRemoteDataSource {
  /// Получить список всех доступных врачей
  Future<List<DoctorModel>> fetchDoctors();
}