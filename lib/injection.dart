import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// 🔹 Doctor Module
import 'views/doctor_list/data/datasources/doctor_remote_data_source.dart';
import 'views/doctor_list/data/repositories/doctor_remote_data_source_impl.dart';
import 'views/doctor_list/data/repositories/doctor_repository_impl.dart';
import 'views/doctor_list/domain/repositories/doctor_repository.dart';
import 'views/doctor_list/domain/usecases/get_available_doctors.dart';
import 'views/doctor_list/presentation/bloc/doctor_list_bloc.dart';

// 🔹 Profile Module
import 'views/profile/data/datasources/profile_remote_data_source.dart';
import 'views/profile/data/datasources/fake_profile_remote_data_source.dart';
import 'views/profile/data/datasources/profile_repository_impl.dart';
import 'views/profile/domain/repositories/profile_repository.dart';
import 'views/profile/domain/usecases/get_user_appointments.dart';
import 'views/profile/presentation/bloc/profile_bloc.dart';

// 🔹 Appointment Module
import 'views/appointment/data/datasources/appointment_remote_data_source.dart';
import 'views/appointment/data/datasources/schedule_local_data_source.dart';
import 'views/appointment/data/repositories/appointment_repository_impl.dart';
import 'views/appointment/domain/repositories/appointment_repository.dart';
import 'views/appointment/domain/usecases/get_available_times.dart';
import 'views/appointment/domain/usecases/book_appointment.dart';
import 'views/appointment/presentation/bloc/appointment_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // 🌐 Dio client
  getIt.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          baseUrl: 'https://your-api-url.com',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      ));

  // 👨‍⚕️ Doctor module
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

  // 👤 Profile module
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => FakeProfileRemoteDataSource(),
  );

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt<ProfileRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetUserAppointments>(
    () => GetUserAppointments(getIt<ProfileRepository>()),
  );

  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(getUserAppointments: getIt<GetUserAppointments>()),
  );

  // 📅 Appointment module
  getIt.registerLazySingleton<ScheduleLocalDataSource>(
    () => ScheduleLocalDataSource(), // 🔸 важно! локальный источник расписаний
  );

  getIt.registerLazySingleton<AppointmentRemoteDataSource>(
    () => AppointmentRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepositoryImpl(getIt<AppointmentRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetAvailableTimes>(
    () => GetAvailableTimes(getIt<ScheduleLocalDataSource>()), // 🔸 локально, не из репозитория
  );

  getIt.registerLazySingleton<BookAppointment>(
    () => BookAppointment(getIt<AppointmentRepository>()),
  );

  getIt.registerFactory<AppointmentBloc>(
    () => AppointmentBloc(
      getAvailableTimes: getIt<GetAvailableTimes>(),
      bookAppointment: getIt<BookAppointment>(),
    ),
  );
}
