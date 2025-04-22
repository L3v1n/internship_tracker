part of 'add_intern_bloc.dart';

sealed class AddInternState {}

final class AddInternDate extends AddInternState {
  final DateTime? startDate;
  final String? startDateFormatted;
  final String? dateError;

  AddInternDate({this.startDate, this.startDateFormatted, this.dateError});
  AddInternDate copyWith({
    DateTime? startDate,
    String? startDateFormatted,
    String? dateError,
  }) {
    return AddInternDate(
      startDate: startDate ?? this.startDate,
      startDateFormatted: startDateFormatted ?? this.startDateFormatted,
      dateError: dateError ?? this.dateError,
    );
  }
}

final class AddInternInitial extends AddInternState {}
