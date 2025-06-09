import 'dart:async';
import '../models/user_appointment_model.dart';
import 'profile_remote_data_source.dart';

class FakeProfileRemoteDataSource implements ProfileRemoteDataSource {
  @override
  Future<List<UserAppointmentModel>> fetchUserAppointments() async {
    // Симуляция задержки сети
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      UserAppointmentModel(
        appointmentId: 'mock-001',
        doctorName: 'Dr. Testov',
        time: DateTime.now().add(const Duration(days: 1)),
      ),
      UserAppointmentModel(
        appointmentId: 'mock-002',
        doctorName: 'Dr. Примеров',
        time: DateTime.now().add(const Duration(days: 3)),
      ),
    ];
  }
}
