import '../models/availability_model.dart';

abstract class AppointmentRemoteDataSource {
  /// Получить доступное расписание для врача
  Future<AvailabilityModel> fetchAvailability(String doctorId);

  /// Забронировать приём
  Future<void> bookAppointment(String doctorId, DateTime time);
}