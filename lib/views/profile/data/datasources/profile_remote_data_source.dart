import '../models/user_appointment_model.dart';

/// Источник данных для профиля
abstract class ProfileRemoteDataSource {
  /// Получить список записей текущего пользователя
  Future<List<UserAppointmentModel>> fetchUserAppointments();
}

