import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import '../bloc/doctor_list_bloc.dart';
import '../bloc/doctor_list_event.dart';
import '../bloc/doctor_list_state.dart';
import '../widgets/doctor_tile.dart';

class DoctorListPage extends StatelessWidget {
  static const routeName = '/doctor_list';

=======

import '../bloc/doctor_list_bloc.dart';
import '../widgets/doctor_tile.dart';
import '../widgets/loading_indicator.dart';

class DoctorListPage extends StatelessWidget {
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(title: const Text('Выбор врача')),
      body: BlocProvider(
        create: (_) => context.read<DoctorListBloc>()..add(LoadDoctors()),
        child: BlocBuilder<DoctorListBloc, DoctorListState>(
          builder: (context, state) {
            if (state is DoctorListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DoctorListLoaded) {
              return ListView.separated(
                itemCount: state.doctors.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final doctor = state.doctors[index];
                  return DoctorTile(doctor: doctor);
                },
              );
            } else if (state is DoctorListError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
=======
      appBar: AppBar(
        title: const Text('Список врачей'),
      ),
      body: BlocBuilder<DoctorListBloc, DoctorListState>(
        builder: (context, state) {
          if (state is DoctorListInitial) {
            context.read<DoctorListBloc>().add(LoadDoctorsEvent());
            return const LoadingIndicator();
          } else if (state is DoctorListLoading) {
            return const LoadingIndicator();
          } else if (state is DoctorListError) {
            return Center(child: Text('Ошибка: ${state.message}'));
          } else if (state is DoctorListLoaded) {
            return ListView.builder(
              itemCount: state.doctors.length,
              itemBuilder: (context, index) {
                final doctor = state.doctors[index];
                return DoctorTile(doctor: doctor);
              },
            );
          }
          return const SizedBox.shrink();
        },
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
      ),
    );
  }
}