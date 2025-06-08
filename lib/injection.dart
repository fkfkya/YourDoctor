/*
Старая версия
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'views/doctor_list/data/datasources/doctor_remote_data_source.dart';
// … и остальные импорты

final getIt = GetIt.instance;

void init({bool useMock = false}) {
  // Core
  getIt.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: 'https://api.yourdoctor.example')),
  );


    // getIt.registerFactory<DoctorRemoteDataSource>(
    //   //() => DoctorRemoteDataSourceImpl(getIt<Dio>()),
    // );
  
  
  // … регистрация репозитория, usecase, bloc как раньше
}
*/
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:your_doctor/views/doctor_list/data/repositories/doctor_remote_data_source_impl.dart';

import 'views/doctor_list/data/datasources/doctor_remote_data_source.dart';
import 'views/doctor_list/data/repositories/doctor_repository_impl.dart';
import 'views/doctor_list/domain/repositories/doctor_repository.dart';
import 'views/doctor_list/domain/usecases/get_available_doctors.dart';
import 'views/doctor_list/presentation/bloc/doctor_list_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // 1. Регистрируем Dio
  getIt.registerLazySingleton<Dio>(() => Dio(
    BaseOptions(
      baseUrl: 'https://your-api-url.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  ));

  // 2. Регистрируем DataSource
  getIt.registerLazySingleton<DoctorRemoteDataSource>(
        () => DoctorRemoteDataSourceImpl(dio: getIt<Dio>()),
  );


  getIt.registerLazySingleton<DoctorRepository>(
        () => DoctorRepositoryImpl(getIt()),
  );
  // 4. Регистрируем UseCase
  getIt.registerLazySingleton(
        () => GetAvailableDoctors(getIt()),
  );

  // 5. Регистрируем BLoC
  getIt.registerFactory(
        () => DoctorListBloc(getAvailableDoctors: getIt()),
  );
}