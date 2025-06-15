// import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_appointment_model.dart';
import 'profile_remote_data_source.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  /* final FirebaseFirestore firestore;

  ProfileRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<UserAppointmentModel>> fetchUserAppointments() async {
    final snapshot = await firestore.collection('appointments').get();
    return snapshot.docs.map((doc) => UserAppointmentModel.fromJson(doc.data())).toList();
  } */
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
