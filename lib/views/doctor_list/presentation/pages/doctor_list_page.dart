import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/doctor_list_bloc.dart';
import '../widgets/doctor_tile.dart';
import '../widgets/loading_indicator.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}