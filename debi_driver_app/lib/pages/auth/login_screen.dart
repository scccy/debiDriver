import 'package:flutter/material.dart';
import 'package:debi_driver_app/constants/plate_constants.dart';
import 'package:debi_driver_app/widgets/plate_input_widget.dart';
import 'package:debi_driver_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLoginSuccess;
  final VoidCallback? onForgotPassword;
  const LoginScreen({super.key, required this.onLoginSuccess, this.onForgotPassword});

  @override
  Widget build(BuildContext context) {
    String plate = '';
    final TextEditingController pwdController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FlutterLogo(size: 56),
                    const SizedBox(height: 24),
                    PlateInputWidget(
                      onPlateChanged: (v) => plate = v,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: pwdController,
                      label: '密码',
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white, // 明确指定按钮文字为白色
                          elevation: 4,
                        ),
                        onPressed: onLoginSuccess,
                        child: const Text('登录', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/forgot_password');
                      },
                      child: const Text('忘记密码?', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 