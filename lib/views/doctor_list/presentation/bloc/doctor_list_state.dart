<<<<<<< HEAD
import 'package:equatable/equatable.dart';
import '../../domain/entities/doctor.dart';

abstract class DoctorListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DoctorListInitial extends DoctorListState {}
class DoctorListLoading extends DoctorListState {}

class DoctorListLoaded extends DoctorListState {
  final List<Doctor> doctors;

  DoctorListLoaded(this.doctors);

  @override
  List<Object?> get props => [doctors];
}

class DoctorListError extends DoctorListState {
  final String message;

  DoctorListError(this.message);

  @override
  List<Object?> get props => [message];
=======
part of 'doctor_list_bloc.dart';

sealed class DoctorListState extends Equatable {
  const DoctorListState();

  @override
  List<Object> get props => [];
}

final class DoctorListInitial extends DoctorListState {}

final class DoctorListLoading extends DoctorListState {}

final class DoctorListLoaded extends DoctorListState {
  final List<Doctor> doctors;

  const DoctorListLoaded({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

final class DoctorListError extends DoctorListState {
  final String message;

  const DoctorListError({required this.message});

  @override
  List<Object> get props => [message];
>>>>>>> cf975edc4e66488e95d17b8b4365af27a24865d2
}