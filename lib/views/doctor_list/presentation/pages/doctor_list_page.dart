import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/doctor_list_bloc.dart';
import '../bloc/doctor_list_event.dart';
import '../bloc/doctor_list_state.dart';
import '../widgets/doctor_tile.dart';

class DoctorListPage extends StatelessWidget {
  static const routeName = '/doctor_list';

  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}