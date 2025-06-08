import '../repositories/appointment_repository.dart';

class BookAppointment {
  final AppointmentRepository repository;

  BookAppointment(this.repository);

  Future<void> call(String doctorId, DateTime time) {
    return repository.bookAppointment(doctorId, time);
  }
}