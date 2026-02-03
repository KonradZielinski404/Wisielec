import 'package:flutter/material.dart';
import 'package:hangman/pages/hangman_page.dart';

class MenuScreen extends StatefulWidget {
  final String username; // Przekazujemy nazwę użytkownika

  const MenuScreen({Key? key, required this.username}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _selectedDifficulty = 'Łatwy'; // Domyślny poziom trudności

  // Metoda do pobrania koloru na podstawie wybranego poziomu trudności
  Color _getBackgroundColor(String difficulty) {
    switch (difficulty) {
      case 'Łatwy':
        return Colors.green.shade100; // Jasny zielony
      case 'Średni':
        return Colors.yellow.shade100; // Jasny żółty
      case 'Trudny':
        return Colors.red.shade100; // Jasny czerwony
      default:
        return Colors.white; // Domyślny kolor
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tekst "Witaj, [username]" w lewym górnym rogu
            Text(
              'Witaj, ${widget.username}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            // Przycisk "Graj" na środku
            Center(
              child: SizedBox(
                width: 200, // Ustawienie szerokości przycisku
                height: 60, // Ustawienie wysokości przycisku
                child: ElevatedButton(
                  onPressed: () {
                    // Przejście do ekranu gry (HangmanPage)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HangmanPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    textStyle: const TextStyle(fontSize: 20), // Większa czcionka
                  ),
                  child: const Text('Graj'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown do wyboru poziomu trudności z dynamicznym kolorem tła
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(_selectedDifficulty),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButton<String>(
                  value: _selectedDifficulty,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                  iconSize: 24,
                  underline: Container(), // Usuwamy domyślną linię pod DropdownButton
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  items: ['Łatwy', 'Średni', 'Trudny']
                      .map((difficulty) => DropdownMenuItem(
                            value: difficulty,
                            child: Text(difficulty),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDifficulty = value!;
                    });
                  },
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}