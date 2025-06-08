<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctor_list_event.dart';
import 'doctor_list_state.dart';
import '../../domain/usecases/get_available_doctors.dart';
=======
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_available_doctors.dart';
import '../../domain/entities/doctor.dart';

part 'doctor_list_event.dart';
part 'doctor_list_state.dart';
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final GetAvailableDoctors getAvailableDoctors;

<<<<<<< HEAD
  DoctorListBloc({required this.getAvailableDoctors})
      : super(DoctorListInitial()) {
    on<LoadDoctors>((event, emit) async {
      emit(DoctorListLoading());
      try {
        final doctors = await getAvailableDoctors();
        emit(DoctorListLoaded(doctors));
      } catch (e) {
        emit(DoctorListError(e.toString()));
=======
  DoctorListBloc({required this.getAvailableDoctors}) : super(DoctorListInitial()) {
    on<LoadDoctorsEvent>((event, emit) async {
      emit(DoctorListLoading());
      try {
        final doctors = await getAvailableDoctors();
        emit(DoctorListLoaded(doctors: doctors));
      } catch (e) {
        emit(DoctorListError(message: e.toString()));
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
      }
    });
  }
}