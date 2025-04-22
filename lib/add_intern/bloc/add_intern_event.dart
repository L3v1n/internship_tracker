part of 'add_intern_bloc.dart';

sealed class AddInternEvent {}

final class AddInternStartDateChanged extends AddInternEvent {
  final DateTime date;

  AddInternStartDateChanged(this.date);
}

final class AddInternCompanyNameChanged extends AddInternEvent {
  final String name;

  AddInternCompanyNameChanged(this.name);
}

final class AddInternRequiredHoursChanged extends AddInternEvent {
  final String hours;

  AddInternRequiredHoursChanged(this.hours);
}

final class SaveInternship extends AddInternEvent {}