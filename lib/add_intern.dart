import 'package:flutter/material.dart';

class AddIntern extends StatefulWidget {
  const AddIntern({super.key});

  @override
  State<AddIntern> createState() => _AddInternState();
}

class _AddInternState extends State<AddIntern> {
  final _formKey = GlobalKey<FormState>();
  final _internName = TextEditingController();
  final _internStartDate = TextEditingController();
  final _requiredRenderHours = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Internship'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                controller: _internName,
                keyboardType: TextInputType.text,
                maxLength: 32,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Internship Name',
                  counterText: '',
                )
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Internship Start Date'),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Internship End Date'),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Required Render Hours'),
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