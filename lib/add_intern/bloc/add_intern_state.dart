part of 'add_intern_bloc.dart';

sealed class AddInternState {
  final DateTime? startDate;
  final String companyName;
  final String requiredHours;

  AddInternState({
    this.startDate,
    this.companyName = '',
    this.requiredHours = '',
  });

  AddInternState copyWith({
    DateTime? startDate,
    String? companyName,
    String? requiredHours,
  });
}

final class AddInternInitial extends AddInternState {
  AddInternInitial({
    super.startDate,
    super.companyName = '',
    super.requiredHours = '',
  });
  
  @override
  AddInternInitial copyWith({
    DateTime? startDate,
    String? companyName,
    String? requiredHours,
  }) {
    return AddInternInitial(
      startDate: startDate ?? this.startDate,
      companyName: companyName ?? this.companyName,
      requiredHours: requiredHours ?? this.requiredHours,
    );
  }
}