import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'add_intern_event.dart';
part 'add_intern_state.dart';

class AddInternBloc extends Bloc<AddInternEvent, AddInternState> {
  AddInternBloc() : super(AddInternInitial()) {
    on<AddInternEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
