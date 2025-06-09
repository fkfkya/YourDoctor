import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Загрузить записи пользователя
class LoadUserAppointments extends ProfileEvent {}
