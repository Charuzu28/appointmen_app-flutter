import 'package:flutter/material.dart';
// import '../components/form_input_field.dart';
// import '../components/form_button.dart';

class NewAppointmentPage extends StatefulWidget {
  const NewAppointmentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  // DateTime _appointmentDate = DateTime.now();
  String _selectedOffice = "Registrar";
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Appointment"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Reason for Appointment",
                ),
                controller: _reasonController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Reason is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                value: _selectedOffice,
                items: ["Registrar", "Cashier", "Dean's Office"]
                    .map((office) => DropdownMenuItem(
                          value: office,
                          child: Text(office),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedOffice = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Office",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save appointment logic here
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
