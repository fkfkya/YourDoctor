import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../datasources/doctor_remote_data_source.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource remote;

  DoctorRepositoryImpl(this.remote);

  @override
  Future<List<Doctor>> getAvailableDoctors() async {
    final models = await remote.fetchDoctors();
    return models
        .map((m) => Doctor(
              id: m.id,
              name: m.name,
              specialty: m.specialty,
              avatarUrl: m.avatarUrl,
            ))
        .toList();
  }
}