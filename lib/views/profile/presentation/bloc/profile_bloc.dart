import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import '../../domain/usecases/get_user_appointments.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserAppointments getUserAppointments;

  ProfileBloc({required this.getUserAppointments}) : super(ProfileInitial()) {
    on<LoadUserAppointments>((event, emit) async {
      emit(ProfileLoading());
      try {
        final appointments = await getUserAppointments();
        emit(ProfileLoaded(appointments));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}