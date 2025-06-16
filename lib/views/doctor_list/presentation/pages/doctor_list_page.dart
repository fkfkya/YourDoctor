import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_doctor/injection.dart'; 
import '../widgets/loading_indicator.dart';
import '../bloc/doctor_list_bloc.dart';
import '../bloc/doctor_list_event.dart';
import '../bloc/doctor_list_state.dart';
import '../widgets/doctor_tile.dart';

class DoctorListPage extends StatelessWidget {
  static const routeName = '/doctor_list';
  const DoctorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorListBloc>(
      create: (_) => getIt<DoctorListBloc>()..add(LoadDoctors()),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Выбор врача'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Image.asset('assets/profile_icon.png'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ),
            ],),
        body: BlocBuilder<DoctorListBloc, DoctorListState>(
          builder: (context, state) {
            if (state is DoctorListLoading) {
              return const LoadingIndicator();
            } else if (state is DoctorListLoaded) {
              final doctors = state.doctors;
              return doctors.isEmpty
                  ? const Center(child: Text('Нет доступных врачей'))
                  : ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        return DoctorTile(doctor: doctors[index]);
                      },
                    );
            } else if (state is DoctorListError) {
              return Center(child: Text('Ошибка: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}