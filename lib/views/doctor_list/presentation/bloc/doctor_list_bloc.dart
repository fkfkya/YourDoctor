import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_available_doctors.dart';
import '../../domain/entities/doctor.dart';

part 'doctor_list_event.dart';
part 'doctor_list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final GetAvailableDoctors getAvailableDoctors;

  DoctorListBloc({required this.getAvailableDoctors}) : super(DoctorListInitial()) {
    on<LoadDoctorsEvent>((event, emit) async {
      emit(DoctorListLoading());
      try {
        final doctors = await getAvailableDoctors();
        emit(DoctorListLoaded(doctors: doctors));
      } catch (e) {
        emit(DoctorListError(message: e.toString()));
      }
    });
  }
}