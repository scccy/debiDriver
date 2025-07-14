import 'package:flutter/material.dart';
import 'package:debi_driver_app/pages/home/home_screen.dart';
import 'package:debi_driver_app/pages/auth/plate_register_screen.dart';
import 'package:debi_driver_app/pages/chat/voice_chat_screen.dart';
import 'package:debi_driver_app/pages/plate/add_plate_screen.dart';
import 'package:debi_driver_app/pages/settings/settings_screen.dart';
import 'package:debi_driver_app/pages/auth/login_screen.dart';
import 'package:debi_driver_app/pages/auth/forgot_password_screen.dart';

void main() {
  runApp(const DebiDriverApp());
}

class DebiDriverApp extends StatefulWidget {
  const DebiDriverApp({super.key});

  @override
  State<DebiDriverApp> createState() => _DebiDriverAppState();
}

class _DebiDriverAppState extends State<DebiDriverApp> {
  bool isRegistered = false;
  bool isLoggedIn = false;

  void onRegisterSuccess() {
    setState(() {
      isRegistered = true;
      isLoggedIn = true;
    });
  }

  void onLoginSuccess() {
    setState(() {
      isLoggedIn = true;
    });
  }

  void onLogout() {
    setState(() {
      isLoggedIn = false;
    });
  }

  void onGoToLogin() {
    setState(() {
      isRegistered = true;
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '黛比驾驶员',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: !isRegistered
          ? PlateRegisterScreen(onRegisterSuccess: onRegisterSuccess, onGoToLogin: onGoToLogin)
          : !isLoggedIn
              ? LoginScreen(onLoginSuccess: onLoginSuccess, onForgotPassword: () {})
              : HomeScreen(onLogout: onLogout),
      routes: {
        '/chat': (context) => const VoiceChatScreen(),
        '/add_plate': (context) => const AddPlateScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/login': (context) => LoginScreen(onLoginSuccess: onLoginSuccess, onForgotPassword: () {}),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}