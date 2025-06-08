<<<<<<< HEAD
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
=======
import '../../domain/repositories/doctor_repository.dart';
import '../datasources/doctor_remote_data_source.dart';
import '../models/doctor_model.dart';
import '../../domain/entities/doctor.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource remoteDataSource;

  DoctorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Doctor>> getAvailableDoctors() async {
    final models = await remoteDataSource.getAvailableDoctors();
    return models.map((model) => model.toEntity()).toList();
  }
}

extension on DoctorModel {
  Doctor toEntity() {
    return Doctor(
      id: id,
      fullName: fullName,
      occupation: occupation,
      schedule: schedule,
    );
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
  }
}