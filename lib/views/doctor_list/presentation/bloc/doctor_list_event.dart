<<<<<<< HEAD
import 'package:equatable/equatable.dart';

abstract class DoctorListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Событие загрузки списка врачей
class LoadDoctors extends DoctorListEvent {}
=======
part of 'doctor_list_bloc.dart';

abstract class DoctorListEvent extends Equatable {
  const DoctorListEvent();

  @override
  List<Object> get props => [];
}

class LoadDoctorsEvent extends DoctorListEvent {}
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
