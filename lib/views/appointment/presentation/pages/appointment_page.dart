import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/appointment_bloc.dart';
import '../bloc/appointment_event.dart';
import '../bloc/appointment_state.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/time_slot_tile.dart';

class AppointmentPage extends StatelessWidget {
  static const routeName = '/appointment';
  final String doctorId;
  const AppointmentPage({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Запись на приём')),
      body: BlocProvider(
        create: (_) => context.read<AppointmentBloc>()
          ..add(LoadAvailability(doctorId)),
        child: BlocBuilder<AppointmentBloc, AppointmentState>(
          builder: (context, state) {
            if (state is AppointmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AppointmentLoaded) {
              return Column(
                children: [
                  CalendarWidget(
                    availableTimes: state.availableTimes,
                    onDateSelected: (date) { /* TODO */ },
                  ),
                  Expanded(
                    child: ListView(
                      children: state.availableTimes.map((time) {
                        final selected = state.selectedTime == time;
                        return TimeSlotTile(
                          time: time,
                          isSelected: selected,
                          onTap: () => context.read<AppointmentBloc>()
                            .add(SelectTimeSlot(time)),
                        );
                      }).toList(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: state is AppointmentLoaded && state.selectedTime != null
                      ? () => context.read<AppointmentBloc>()
                        .add(ConfirmBooking(
                          doctorId: doctorId,
                          time: state.selectedTime!,
                        ))
                      : null,
                    child: const Text('Записаться'),
                  ),
                ],
              );
            } else if (state is AppointmentBooking) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AppointmentBooked) {
              return const Center(child: Text('Успешно записано!'));
            } else if (state is AppointmentError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}