import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Logowanie',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Nazwa użytkownika'),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Hasło'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuScreen(
                        username: usernameController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Zaloguj'),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text(
                  'Zarejestruj się',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}