import 'package:dio/dio.dart';

import '../models/doctor_model.dart';

/*
Старая версия
abstract class DoctorRemoteDataSource {
  /// Запрашивает список врачей с сервера
  Future<List<DoctorModel>> fetchDoctors();
}


abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getAvailableDoctors();
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  final Dio dio;

  DoctorRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<DoctorModel>> getAvailableDoctors() async {
    try {
      final response = await dio.get('/doctors');
      return (response.data as List)
          .map((json) => DoctorModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load doctors: $e');
    }
  }
}
*/
abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getAvailableDoctors();
}