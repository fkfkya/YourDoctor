import 'package:flutter_bloc/flutter_bloc.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';
import '../../domain/usecases/get_available_times.dart';
import '../../domain/usecases/book_appointment.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final GetAvailableTimes getAvailableTimes;
  final BookAppointment bookAppointment;

  AppointmentBloc({
    required this.getAvailableTimes,
    required this.bookAppointment,
  }) : super(AppointmentInitial()) {
    on<LoadAvailability>((event, emit) async {
      emit(AppointmentLoading());
      try {
        final times = await getAvailableTimes(event.doctorId);
        emit(AppointmentLoaded(availableTimes: times));
      } catch (e) {
        emit(AppointmentError(e.toString()));
      }
    });

    on<SelectTimeSlot>((event, emit) {
      final state = this.state;
      if (state is AppointmentLoaded) {
        emit(AppointmentLoaded(
          availableTimes: state.availableTimes,
          selectedTime: event.time,
        ));
      }
    });

    on<ConfirmBooking>((event, emit) async {
      emit(AppointmentBooking());
      try {
        await bookAppointment(event.doctorId, event.time);
        emit(AppointmentBooked());
      } catch (e) {
        emit(AppointmentError(e.toString()));
      }
    });
  }
}