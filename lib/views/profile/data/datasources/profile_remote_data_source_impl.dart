import '../models/user_appointment_model.dart';
import 'profile_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:your_doctor/views/doctor_list/data/datasources/doctors_db.dart';
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserAppointmentModel>> fetchUserAppointments() async {
    try {
      return List.from(doctors_db);
    } on DioException catch (e) {
      throw Exception('Не удалось получить записи: ${e.message}');
    }
  }
}
