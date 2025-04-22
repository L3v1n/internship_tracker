import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../add_intern_barrel.dart';

class AddInternView extends StatefulWidget {
  const AddInternView({super.key});

  @override
  State<AddInternView> createState() => _AddInternViewState();
}

class _AddInternViewState extends State<AddInternView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _hoursController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
    _hoursController.addListener(_onHoursChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hoursController.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    context.read<AddInternBloc>().add(
      AddInternCompanyNameChanged(_nameController.text),
    );
  }

  void _onHoursChanged() {
    context.read<AddInternBloc>().add(
      AddInternRequiredHoursChanged(_hoursController.text),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      context.read<AddInternBloc>().add(AddInternStartDateChanged(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Internship')),
      body: BlocBuilder<AddInternBloc, AddInternState>(
        builder: (context, state) {
          if (state.startDate != null) {
            _dateController.text = DateFormat(
              'MM/dd/yyyy',
            ).format(state.startDate!);
          }
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  labelText('Company Name'),
                  const SizedBox(height: 4),
                  companyNameField(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelText('Start Date'),
                            const SizedBox(height: 4),
                            dateField(context),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelText('Required Hours'),
                            const SizedBox(height: 4),
                            hoursField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  doneButton(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Text labelText(String text) => Text(text, style: TextStyle(fontSize: 14));

  TextFormField hoursField() {
    return TextFormField(
      controller: _hoursController,
      keyboardType: TextInputType.number,
      maxLength: 4,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        hintText: 'Enter Hours',
        counterText: '',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter required hours';
        }
        final hours = int.tryParse(value);
        if (hours != null) {
          if (hours <= 0) {
            return 'Value is too small';
          }
          if (hours >= 9999) {
            return 'Valie is too large';
          }
        }
        return null;
      },
    );
  }

  TextFormField dateField(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: _dateController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        hintText: 'mm/dd/yyyy',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () => _selectDate(context),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a start date';
        }
        return null;
      },
    );
  }

  TextFormField companyNameField() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      maxLength: 32,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        hintText: 'Enter Company Name',
        counterText: '',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a company';
        }
        return null;
      },
    );
  }

  ElevatedButton doneButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() == true) {
          context.read<AddInternBloc>().add(SaveInternship());

          customSnackBar("Internship added successfully!");
          context.pop();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
      ),
      child: Text(
        'Done',
        style: TextStyle(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
        ),
      ),
    );
  }

  void customSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
