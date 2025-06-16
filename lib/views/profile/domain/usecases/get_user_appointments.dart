import '../repositories/profile_repository.dart';
import '../entities/user_appointment.dart';

class GetUserAppointments {
  final ProfileRepository repository;

  GetUserAppointments(this.repository);

  Future<List<UserAppointment>> call() {
    return repository.getUserAppointments();
  }
}