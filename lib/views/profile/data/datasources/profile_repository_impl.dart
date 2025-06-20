import '../../domain/repositories/profile_repository.dart';
import '../../domain/entities/user_appointment.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl(this.remote);

  @override
  Future<List<UserAppointment>> getUserAppointments() async {
    final models = await remote.fetchUserAppointments();
    return models.map((m) => UserAppointment(
      appointment_id: m.appointment_id,
      doctor_id: m.doctor_id,
      time: m.time,
    )).toList();
  }
}