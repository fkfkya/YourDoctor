import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctor_list_event.dart';
import 'doctor_list_state.dart';
import '../../domain/usecases/get_available_doctors.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final GetAvailableDoctors getAvailableDoctors;

  DoctorListBloc({required this.getAvailableDoctors})
      : super(DoctorListInitial()) {
    on<LoadDoctors>((event, emit) async {
      emit(DoctorListLoading());
      try {
        final doctors = await getAvailableDoctors();
        emit(DoctorListLoaded(doctors));
      } catch (e) {
        emit(DoctorListError(e.toString()));
      }
    });
  }
}