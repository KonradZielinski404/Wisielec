import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Rejestracja',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(labelText: 'Nazwa użytkownika'),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Hasło'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Dodaj logikę rejestracji
                },
                child: const Text('Zarejestruj się'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Wróć do logowania'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}