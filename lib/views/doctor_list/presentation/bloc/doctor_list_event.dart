import 'package:equatable/equatable.dart';

abstract class DoctorListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Событие загрузки списка врачей
class LoadDoctors extends DoctorListEvent {}