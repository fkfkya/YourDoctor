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
