import 'package:bloc/bloc.dart';
import '../../models/internship_model.dart';
import '../../repository/repository.dart';

part 'add_intern_event.dart';
part 'add_intern_state.dart';

class AddInternBloc extends Bloc<AddInternEvent, AddInternState> {
  final InternshipRepository repository;

  AddInternBloc({required this.repository}) : super(AddInternInitial()) {
    on<AddInternStartDateChanged>(_onStartDateChanged);
    on<AddInternCompanyNameChanged>(_onCompanyNameChanged);
    on<AddInternRequiredHoursChanged>(_onRequiredHoursChanged);
    on<SaveInternship>(_onSaveInternship);
  }

  void _onStartDateChanged(
    AddInternStartDateChanged event,
    Emitter<AddInternState> emit,
  ) {
    emit(state.copyWith(startDate: event.date));
  }

  void _onCompanyNameChanged(
    AddInternCompanyNameChanged event,
    Emitter<AddInternState> emit,
  ) {
    emit(state.copyWith(companyName: event.name));
  }

  void _onRequiredHoursChanged(
    AddInternRequiredHoursChanged event,
    Emitter<AddInternState> emit,
  ) {
    emit(state.copyWith(requiredHours: event.hours));
  }

  void _onSaveInternship(
    SaveInternship event,
    Emitter<AddInternState> emit,
  ) async {
    if (state.companyName.isNotEmpty &&
        state.startDate != null &&
        state.requiredHours.isNotEmpty) {
      final internship = InternshipModel(
        companyName: state.companyName,
        startDate: state.startDate!,
        requiredHours: int.tryParse(state.requiredHours) ?? 0,
      );

      await repository.addInternship(internship);
    }
  }
}
