part of 'add_intern_bloc.dart';

sealed class AddInternEvent {}

final class OpenStartDatePicker extends AddInternEvent {}

final class StartDateSelected extends AddInternEvent {
  final DateTime date;
  StartDateSelected(this.date);
}
