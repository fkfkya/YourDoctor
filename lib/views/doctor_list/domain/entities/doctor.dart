class Doctor {
  final String id;
  final String fullName;
  final String occupation;
  final Map<String, List<String>> schedule;

  Doctor({
    required this.id,
    required this.fullName,
    required this.occupation,
    required this.schedule,
  });
}