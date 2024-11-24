import 'package:flutter/material.dart';
import '../components/form_input_field.dart';
import '../components/form_button.dart';

class AppointmentPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule Appointment"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FormInputField(
                hintText: "Appointment Title",
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              FormInputField(
                hintText: "Date (e.g., 2024-12-01)",
                controller: _dateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Date is required';
                  }
                  return null;
                },
              ),
              FormInputField(
                hintText: "Time (e.g., 10:00 AM)",
                controller: _timeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Time is required';
                  }
                  return null;
                },
              ),
              FormInputField(
                hintText: "Description",
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              FormButton(
                label: "Submit",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Appointment Scheduled!')),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
