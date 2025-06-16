import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/appointment_bloc.dart';
import '../bloc/appointment_event.dart';
import '../bloc/appointment_state.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/time_slot_tile.dart';
import '../../../doctor_list/data/datasources/doctors_db.dart';
import '../../../doctor_list/data/models/doctor_model.dart';
import 'package:your_doctor/views/appointment/data/datasources/appointment_remote_data_source.dart';
import 'package:your_doctor/views/appointment/data/models/availability_model.dart';
import 'package:your_doctor/views/profile/data/datasources/fake_profile_remote_data_source.dart';
import 'package:your_doctor/views/profile/data/models/user_appointment_model.dart';

class AppointmentPage extends StatefulWidget {
  static const routeName = '/appointment';
  final String doctorId;

  const AppointmentPage({super.key, required this.doctorId});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late DoctorModel doctor;

  @override
  void initState() {
    super.initState();
    print('[UI] doctorId = ${widget.doctorId}');
    context.read<AppointmentBloc>().add(LoadAvailability(widget.doctorId));

    // Загружаем доктора из базы по ID
    doctor = doctors_db.firstWhere(
      (doc) => doc.id == widget.doctorId,
      orElse: () => DoctorModel(id: '', name: 'Неизвестно', specialty: '—'),
    );
    print('[UI] Doctor loaded: ${doctor.name}, ${doctor.specialty}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Запись на приём')),
      body: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          print('[UI] State: $state');

          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AppointmentLoaded) {
            print('[UI] Loaded ${state.availableTimes.length} slots');
            final dates = state.availableTimes.map((e) => e.date).toSet().toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.specialty,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                CalendarWidget(
                  availableDates: dates,
                  onDateSelected: (date) {
                    print('[UI] Date selected: $date');
                    context.read<AppointmentBloc>().add(SelectDate(date));
                  },
                ),
                Expanded(
                  child: ListView(
                    children: state.availableTimes
                        .where((time) => time.date == state.selectedDate)
                        .map((time) {
                      final selected = state.selectedTime == time;
                      return TimeSlotTile(
                        time: time,
                        selected: selected,
                        onTap: () {
                          print('[UI] Time selected: ${time.time}');
                          context.read<AppointmentBloc>().add(SelectTime(time));
                        },
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: state.selectedTime != null
                        ? () {
                            print('[UI] Confirming appointment for ${state.selectedTime}');
                            context.read<AppointmentBloc>().add(
                                  ConfirmAppointment(
                                    doctorId: widget.doctorId,
                                    selectedTime: state.selectedTime!,
                                  ),
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Вы успешно записались!"),
                              ),
                            );
                            Navigator.pop(context);
                            bookApp(widget.doctorId, state.selectedTime!);
                          }
                        : null,
                    child: const Text('Записаться'),
                  ),
                ),
              ],
            );
          } else if (state is AppointmentError) {
            print('[UI] AppointmentError: ${state.message}');
            return Center(child: Text('Ошибка: ${state.message}'));
          } else {
            print('[UI] Unknown state');
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}


Future<void> bookApp(String doctorId, AvailableTime time) async {
  scheduleDb[doctorId]?.removeWhere(
        (t) => t.date.year == time.date.year &&
        t.date.month == time.date.month &&
        t.date.day == time.date.day &&
        t.time == time.time,
  );
  appoint_db.add(UserAppointmentModel(appointment_id: (appoint_db.length+1).toString(),
      doctor_id: doctorId, time: DateTime(time.date.year, time.date.month, time.date.day,
          DateTime.parse(time.time).hour.toInt(), DateTime.parse(time.time).minute.toInt())));
}