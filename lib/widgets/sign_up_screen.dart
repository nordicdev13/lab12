import 'package:flutter/material.dart';
import './sign_in_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

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

              const SizedBox(height: 10),

              Center(
                child: Text("Sign up", style: Theme.of(context).textTheme.titleMedium),
              ),

              const SizedBox(height: 24),

              const Text("Name:", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              TextFormField(
                controller: nameCtrl,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Поле не може бути пустим";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

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

              const SizedBox(height: 16),

              const Text("Password:", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              TextFormField(
                controller: passCtrl,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Поле не може бути пустим";
                  }
                  if (value.trim().length < 7) {
                    return "Пароль має бути не менше 7 символів";
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
                        content: Text("User registered"),
                      ),
                    );
                  }
                },
                child: const Text("Sign Up"),
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
