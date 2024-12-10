import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/dashboard.dart';
import 'pages/appointment_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Ensure this matches your setup.
  );
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
        '/dashboard': (context) => const DashboardPage(),
        '/appointment': (context) => const NewAppointmentPage(),
        '/main': (context) => LoginPage(),
      },
    );
  }
}
