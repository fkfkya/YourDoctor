class UserAppointment {
  final String appointment_id;
  final String doctor_id;
  final DateTime time;

  UserAppointment({
    required this.appointment_id,
    required this.doctor_id,
    required this.time,
  });
}