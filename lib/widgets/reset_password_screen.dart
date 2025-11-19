import 'package:flutter/material.dart';
import './sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: Text("Reset password", style: Theme.of(context).textTheme.titleMedium),
              ),

              const SizedBox(height: 24),

              const Text("Email:", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),

              TextFormField(
                controller: emailCtrl,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Поле не може бути пустим";
                  }
                  if (!isValidEmail(value.trim())) {
                    return "Некоректний email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (ctx) => const AlertDialog(
                        title: Text("Success"),
                        content: Text("Password reset link sent"),
                      ),
                    );
                  }
                },
                child: const Text("Reset"),
              ),

              const SizedBox(height: 24.0),

              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
