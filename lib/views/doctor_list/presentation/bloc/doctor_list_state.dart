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
}