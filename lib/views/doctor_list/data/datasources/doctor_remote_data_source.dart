import '../models/doctor_model.dart';

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getAvailableDoctors();
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  @override
  Future<List<DoctorModel>> getAvailableDoctors() async {
    return mockDoctors.map((doctor) => DoctorModel.fromJson(doctor)).toList();
  }
}

// Mock данные для врачей
final List<Map<String, dynamic>> mockDoctors = [
  {
    'id': '1',
    'fullName': 'Сергей Иванов К.',
    'occupation': 'Терапевт',
    'schedule': {
      'monday': ['09:00', '11:00', '14:00'],
      'wednesday': ['10:00', '13:00', '15:00'],
      'friday': ['09:00', '12:00', '16:00'],
    },
  },
  {
    'id': '2',
    'fullName': 'Мария Спиридонова В.',
    'occupation': 'Кардиолог',
    'schedule': {
      'tuesday': ['08:00', '12:00', '17:00'],
      'thursday': ['09:00', '11:00', '14:00'],
      'saturday': ['10:00', '13:00'],
    },
  },
  {
    'id': '3',
    'fullName': 'Алексей Непомнящий А.',
    'occupation': 'Невролог',
    'schedule': {
      'monday': ['08:00', '10:00', '13:00'],
      'tuesday': ['09:00', '11:00'],
      'friday': ['10:00', '14:00', '16:00'],
    },
  },
  {
    'id': '4',
    'fullName': 'Наталья Девичева З.',
    'occupation': 'Терапевт',
    'schedule': {
      'tuesday': ['08:00', '12:00', '17:00'],
      'thursday': ['09:00', '11:00', '14:00'],
      'friday': ['10:00', '14:00', '16:00'],
      'saturday': ['10:00', '13:00'],
    },
  },
  {
    'id': '5',
    'fullName': 'Николай Крамник К.',
    'occupation': 'Лор',
    'schedule': {
      'monday': ['08:00', '09:00', '10:00', '11:00'],
      'tuesday': ['09:00', '13:00', '17:00'],
      'thursday': ['08:00', '10:00', '13:00'],
    },
  },
];