import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/dashboard.dart';
import 'pages/appointment_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/signup': (context) => SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
        '/appointment': (context) => NewAppointmentPage(),
      },
    );
  }
}
