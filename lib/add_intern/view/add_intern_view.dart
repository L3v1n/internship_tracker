import 'package:flutter/material.dart';

class AddInternView extends StatelessWidget {
  const AddInternView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _internshipNameController = TextEditingController();
    final _internshipStartDateController = TextEditingController();
    final _internshipEndDateController = TextEditingController();
    final _requiredRenderHoursController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(title: const Text('Add Internship')),
      body: Form(
        key: GlobalKey<FormState>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                maxLength: 32,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Internship Name',
                  counterText: '',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Internship Start Date',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Internship End Date',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Required Render Hours',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                child: const Text('Add Internship'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
