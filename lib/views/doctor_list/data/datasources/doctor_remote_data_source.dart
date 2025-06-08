import '../models/doctor_model.dart';

abstract class DoctorRemoteDataSource {
  /// Запрашивает список врачей с сервера
  Future<List<DoctorModel>> fetchDoctors();
}