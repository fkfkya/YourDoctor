import '../models/user_appointment_model.dart';

abstract class ProfileRemoteDataSource {
  Future<List<UserAppointmentModel>> fetchUserAppointments();
}

