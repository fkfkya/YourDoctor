abstract class AppointmentRepository {
  /// Список доступных времён для записи
  Future<List<DateTime>> fetchAvailableTimes(String doctorId);

  /// Записать на приём
  Future<void> bookAppointment(String doctorId, DateTime time);
}