import '../repositories/doctor_repository.dart';
import '../entities/doctor.dart';

class GetAvailableDoctors {
  final DoctorRepository repository;

  GetAvailableDoctors({required this.repository});

  Future<List<Doctor>> call() async {
    return await repository.getAvailableDoctors();
  }
}