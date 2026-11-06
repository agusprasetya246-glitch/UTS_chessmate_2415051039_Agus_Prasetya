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

            // --- IMPLEMENTASI RESPONSIVE LAYOUT ---
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Jika lebar layar lebih dari 600 (Tablet/Web), gunakan GridView
                  if (constraints.maxWidth > 600) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 Kolom
                            childAspectRatio:
                                2.5, // Mengatur rasio lebar:tinggi kartu
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return OpeningCard(
                          title: 'Dummy Opening ${index + 1}',
                          ecoCode: 'A0${index + 1}',
                          onTap: () {},
                        );
                      },
                    );
                  }

                  // Jika layar HP (Compact), gunakan ListView
                  return ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return OpeningCard(
                        title: 'Dummy Opening ${index + 1}',
                        ecoCode: 'A0${index + 1}',
                        onTap: () {},
                      );
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
