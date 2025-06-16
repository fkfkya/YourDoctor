import 'package:flutter_bloc/flutter_bloc.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';
import '../../domain/usecases/get_available_times.dart';
import '../../domain/usecases/book_appointment.dart';
import '../../data/models/availability_model.dart';

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
    print('[BLoC] Loading availability for doctorId = ${event.doctorId}');
    final times = await getAvailableTimes(event.doctorId);
    print('[BLoC] getAvailableTimes returned ${times.length} slots');
    
    final initialDate = times.isNotEmpty ? times.first.date : null;
    print('[BLoC] initialDate = $initialDate');

    emit(AppointmentLoaded(
      availableTimes: times,
      selectedDate: initialDate,
    ));
  } catch (e) {
    print('[BLoC] ERROR: $e');
    emit(AppointmentError(e.toString()));
  }
});

    on<SelectDate>((event, emit) {
      final state = this.state;
      if (state is AppointmentLoaded) {
        emit(state.copyWith(selectedDate: event.date));
      }
    });

    on<SelectTime>((event, emit) {
      final state = this.state;
      if (state is AppointmentLoaded) {
        emit(state.copyWith(selectedTime: event.time));
      }
    });

    on<ConfirmAppointment>((event, emit) async {
      emit(AppointmentBooking());
      try {
        await bookAppointment(event.doctorId, event.selectedTime);
        emit(AppointmentBooked());
      } catch (e) {
        emit(AppointmentError(e.toString()));
      }
    });
  }
}