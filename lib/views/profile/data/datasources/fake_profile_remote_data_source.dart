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
        appointment_id: '1',
        doctor_id: '72183',
        time: DateTime.now().add(Duration(days: 1)).copyWith(hour: 15, minute: 0),
      ),
      UserAppointmentModel(
        appointment_id: '2',
        doctor_id: '67527',
        time: DateTime.now().add(const Duration(days: 3)).copyWith(hour: 11, minute: 0),
      ),
      UserAppointmentModel(
        appointment_id: '3',
        doctor_id: '12450',
        time: DateTime.now().subtract(const Duration(days: 7)).copyWith(hour: 8, minute: 30),
      ),
    ];
  }
}
