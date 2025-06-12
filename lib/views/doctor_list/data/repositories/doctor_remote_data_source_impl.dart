import 'package:dio/dio.dart';
import '../datasources/doctor_remote_data_source.dart';
import '../models/doctor_model.dart';
import '../datasources/doctors_db.dart';

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  final Dio dio;

  DoctorRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<DoctorModel>> getAvailableDoctors() async {
    try {
      return List.from(doctors_db)..sort((a, b) => a.specialty.compareTo(b.specialty));
    } on DioException catch (e) {
      throw Exception('Failed to fetch doctors: ${e.message}');
    }
  }
}