import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

part 'add_intern_event.dart';
part 'add_intern_state.dart';

class AddInternBloc extends Bloc<AddInternEvent, AddInternState> {
  final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');

  AddInternBloc() : super(AddInternInitial()) {
    on<OpenStartDatePicker>(_onOpenStartDatePicker);
    on<StartDateSelected>(_onStartDateSelected);
  }

  Future<void> _onOpenStartDatePicker(
    OpenStartDatePicker event,
    Emitter<AddInternState> emit,
  ) async {}

  Future<void> _onStartDateSelected(
    StartDateSelected event,
    Emitter<AddInternState> emit,
  ) async {}
}
