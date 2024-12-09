import 'package:flutter/material.dart';
import '../components/form_input_field.dart';
import '../components/form_button.dart';
import '../utilities/validators.dart';
import 'sign_up_page.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import '../auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

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
                    "Hello, Student!",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sign In to Set Appointment",
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
                        const SizedBox(height: 40),
                        FormButton(
                          label: "Login",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _login(context);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                );
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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

  _login(BuildContext context) async {
    try {
      final user = await _auth.loginUserWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      log("Login Result: $user");
      if (user == null) {
        log("Login Failed");
        _showToast("Incorrect username and password");
      } else {
        log("User Login Successfully");
        Navigator.pushReplacementNamed(context, "/dashboard");
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        log("Firebase Login Error: ${e.code}, ${e.message}");
        if (e.code == "user-not-found") {
          _showToast("No account found for this email.");
        } else if (e.code == "wrong-password") {
          _showToast("Incorrect password.");
        } else {
          _showToast("An unexpected error occurred.");
        }
      }
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
        fontSize: 16.0);
  }
}
