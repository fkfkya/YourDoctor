part of 'doctor_list_bloc.dart';

abstract class DoctorListEvent extends Equatable {
  const DoctorListEvent();

  @override
  List<Object> get props => [];
}

class LoadDoctorsEvent extends DoctorListEvent {}