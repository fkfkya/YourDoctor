import '../../data/models/availability_model.dart';
import '../datasources/appointment_remote_data_source.dart';
import '../../domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<AvailableTime>> getAvailableTimes(String doctorId) {
    return remoteDataSource.fetchAvailableTimes(doctorId);
  }

  @override
  Future<void> bookAppointment(String doctorId, AvailableTime time) {
    return remoteDataSource.sendBooking(doctorId, time);
  }
}
