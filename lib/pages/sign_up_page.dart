import 'package:appointment_app_flutter/auth/auth_service.dart';
import 'package:appointment_app_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';
import '../components/form_input_field.dart';
import '../components/form_button.dart';
import '../utilities/validators.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';

class SignUpPage extends StatelessWidget {
  final _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue, Colors.blueAccent, Colors.lightBlue],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome,",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Create your account",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        FormInputField(
                          hintText: "Full Name",
                          controller: _fullNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Full name is required';
                            }
                            return null;
                          },
                        ),
                        FormInputField(
                          hintText: "Email",
                          controller: _emailController,
                          validator: Validators.validateEmail,
                        ),
                        FormInputField(
                          hintText: "Password",
                          controller: _passwordController,
                          obscureText: true,
                          validator: Validators.validatePassword,
                        ),
                        FormInputField(
                          hintText: "Confirm Password",
                          controller: _confirmPasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm password is required';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        FormButton(
                          label: "Sign Up",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Navigate to the dashboard if validation is successful
                              _signup(context);
                            }
                          },
                        ),
                        const SizedBox(height: 40),
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signup(BuildContext context) async {
    final user = await _auth.createUserWithEmailAndPassword(
      _emailController.text, // Pass email
      _passwordController.text, // Pass password
    );
    if (user != null) {
      log("User Created Successfully");
      Navigator.pushReplacementNamed(context, "/dashboard");
    } else {
      log("Signup Failed");
      _showToast("Failed to create account. Please try again.");
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
