import '../models/user_appointment_model.dart';
import 'profile_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'fake_profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserAppointmentModel>> fetchUserAppointments() async {
    try {
      return List.from(appoint_db);
    } on DioException catch (e) {
      throw Exception('Не удалось получить записи: ${e.message}');
    }
  }
}
