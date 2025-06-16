import '../repositories/appointment_repository.dart';
import '../../data/models/availability_model.dart';

class BookAppointment {
  final AppointmentRepository repository;

  BookAppointment(this.repository);

  Future<void> call(String doctorId, AvailableTime time) {
    return repository.bookAppointment(doctorId, time);
  }
}
