class Doctor {
  final String id;
<<<<<<< HEAD
  final String name;
  final String specialty;
  final String avatarUrl;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.avatarUrl,
=======
  final String fullName;
  final String occupation;
  final Map<String, List<String>> schedule;

  Doctor({
    required this.id,
    required this.fullName,
    required this.occupation,
    required this.schedule,
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
  });
}