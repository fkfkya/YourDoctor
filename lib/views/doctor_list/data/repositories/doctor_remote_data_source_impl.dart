import 'package:dio/dio.dart';
import '../datasources/doctor_remote_data_source.dart';
import '../models/doctor_model.dart';


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
    } on DioException catch (e) {
      throw Exception('Failed to fetch doctors: ${e.message}');
    }
  }
}