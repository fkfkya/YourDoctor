import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'views/doctor_list/data/datasources/doctor_remote_data_source.dart';
import 'views/doctor_list/data/repositories/doctor_remote_data_source_impl.dart';
import 'views/doctor_list/data/repositories/doctor_repository_impl.dart';
import 'views/doctor_list/domain/repositories/doctor_repository.dart';
import 'views/doctor_list/domain/usecases/get_available_doctors.dart';
import 'views/doctor_list/presentation/bloc/doctor_list_bloc.dart';

import 'views/profile/data/datasources/profile_remote_data_source.dart';
// import 'views/profile/data/datasources/profile_remote_data_source_impl.dart';
import 'views/profile/data/datasources/profile_repository_impl.dart';
import 'views/profile/domain/repositories/profile_repository.dart';
import 'views/profile/domain/usecases/get_user_appointments.dart';
import 'views/profile/presentation/bloc/profile_bloc.dart';

import 'views/profile/data/datasources/fake_profile_remote_data_source.dart';


final getIt = GetIt.instance;

void init() {
  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          baseUrl: 'https://your-api-url.com',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      ));

  // Doctor module
  getIt.registerLazySingleton<DoctorRemoteDataSource>(
    () => DoctorRemoteDataSourceImpl(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<DoctorRepository>(
    () => DoctorRepositoryImpl(getIt<DoctorRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetAvailableDoctors>(
    () => GetAvailableDoctors(getIt<DoctorRepository>()),
  );

  getIt.registerFactory<DoctorListBloc>(
    () => DoctorListBloc(getAvailableDoctors: getIt<GetAvailableDoctors>()),
  );

  // 🔻 Firebase отключено
  // getIt.registerLazySingleton<FirebaseFirestore>(
  //   () => FirebaseFirestore.instance,
  // );



  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt<ProfileRemoteDataSource>()),
  );

  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => FakeProfileRemoteDataSource(),
  );


  getIt.registerLazySingleton<GetUserAppointments>(
    () => GetUserAppointments(getIt<ProfileRepository>()),
  );

  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(getUserAppointments: getIt<GetUserAppointments>()),
  );
}
