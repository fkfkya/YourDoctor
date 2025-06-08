import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void init() {
  // Core
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
  baseUrl: 'https://api.yourdoctor.example',
  connectTimeout: const Duration(milliseconds: 5000),
  receiveTimeout: const Duration(milliseconds: 3000),
)));

  // Здесь позже будем регистрировать все наши BLoC, репозитории и usecases
}
