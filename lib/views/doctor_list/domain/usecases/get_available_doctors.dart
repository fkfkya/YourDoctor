import '../repositories/doctor_repository.dart';
import '../entities/doctor.dart';

class GetAvailableDoctors {
  final DoctorRepository repository;

  GetAvailableDoctors(this.repository);

  Future<List<Doctor>> call() async {
    return repository.getAvailableDoctors();
  }
}