import 'package:equatable/equatable.dart';
import '../../domain/entities/user_appointment.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<UserAppointment> appointments;

  ProfileLoaded(this.appointments);

  @override
  List<Object?> get props => [appointments];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}