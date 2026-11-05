import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/opening_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChessMate',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to ChessMate!',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your personal chess study tracker.',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  // Memanggil Reusable Widget
                  return OpeningCard(
                    title: 'Dummy Opening ${index + 1}',
                    ecoCode: 'A0${index + 1}',
                    onTap: () {
                      // Nanti diisi navigasi ke Detail
                      print('Tapped on opening ${index + 1}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
