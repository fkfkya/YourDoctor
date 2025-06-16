import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:your_doctor/views/doctor_list/presentation/pages/doctor_list_page.dart';
import 'package:your_doctor/views/appointment/presentation/pages/appointment_page.dart';
import 'package:your_doctor/views/profile/presentation/pages/profile_page.dart';

import '../injection.dart';

import '../views/profile/presentation/bloc/profile_bloc.dart';
import '../views/profile/presentation/bloc/profile_event.dart';

import '../views/appointment/presentation/bloc/appointment_bloc.dart';

class AppRouter {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {

      case DoctorListPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const DoctorListPage(),
        );

      case AppointmentPage.routeName:
        final doctorId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AppointmentBloc>(), // без .add()
            child: AppointmentPage(doctorId: doctorId),
          ),
        );

      case ProfilePage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProfileBloc>()..add(LoadUserAppointments()),
            child: const ProfilePage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
