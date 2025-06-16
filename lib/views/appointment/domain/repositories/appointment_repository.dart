import "../../data/models/availability_model.dart";

abstract class AppointmentRepository {
  Future<List<AvailableTime>> getAvailableTimes(String doctorId);
  Future<void> bookAppointment(String doctorId, AvailableTime time);
}

