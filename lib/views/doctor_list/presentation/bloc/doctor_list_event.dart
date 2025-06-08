import 'package:equatable/equatable.dart';

abstract class DoctorListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDoctors extends DoctorListEvent {}