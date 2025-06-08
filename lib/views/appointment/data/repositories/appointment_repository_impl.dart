import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_remote_data_source.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remote;

  AppointmentRepositoryImpl(this.remote);

  @override
  Future<List<DateTime>> fetchAvailableTimes(String doctorId) async {
    final availability = await remote.fetchAvailability(doctorId);
    return availability.slots
        .where((slot) => slot.isAvailable)
        .map((slot) => slot.time)
        .toList();
  }

  @override
  Future<void> bookAppointment(String doctorId, DateTime time) {
    return remote.bookAppointment(doctorId, time);
  }
}