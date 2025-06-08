import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../datasources/doctor_remote_data_source.dart';
import '../models/doctor_model.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource remoteDataSource;

  DoctorRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Doctor>> getAvailableDoctors() async {
    final models = await remoteDataSource.getAvailableDoctors(); // Исправленное имя метода
    return models
        .map((model) => Doctor(
      id: model.id,
      name: model.name,
      specialty: model.specialty,
      avatarUrl: model.avatarUrl,
    ))
        .toList();
  }
}