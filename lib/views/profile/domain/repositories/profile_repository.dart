import '../entities/user_appointment.dart';

/// Репозиторий профиля
abstract class ProfileRepository {
  /// Получить список записей пользователя
  Future<List<UserAppointment>> getUserAppointments();
}