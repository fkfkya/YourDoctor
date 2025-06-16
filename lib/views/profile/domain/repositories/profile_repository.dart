import '../entities/user_appointment.dart';

abstract class ProfileRepository {
  Future<List<UserAppointment>> getUserAppointments();
}