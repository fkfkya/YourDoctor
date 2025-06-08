import '../repositories/appointment_repository.dart';

class GetAvailableTimes {
  final AppointmentRepository repository;

  GetAvailableTimes(this.repository);

  Future<List<DateTime>> call(String doctorId) {
    return repository.fetchAvailableTimes(doctorId);
  }
}