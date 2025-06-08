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
}