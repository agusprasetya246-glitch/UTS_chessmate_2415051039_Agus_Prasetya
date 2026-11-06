import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/opening_card.dart';
import '../providers/opening_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OpeningProvider>().fetchOpenings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final openingProvider = context.watch<OpeningProvider>();

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (openingProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (openingProvider.errorMessage != null) {
                    return Center(
                      child: Text(
                        openingProvider.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (openingProvider.openings.isEmpty) {
                    return const Center(
                      child: Text('Tidak ada data pembukaan.'),
                    );
                  }

                  if (constraints.maxWidth > 600) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemCount: openingProvider.openings.length,
                      itemBuilder: (context, index) {
                        final opening = openingProvider.openings[index];
                        return OpeningCard(
                          title: opening.name,
                          ecoCode: opening.eco,
                          onTap: () {}, // Dikosongkan dulu untuk Tahap 8
                        );
                      },
                    );
                  }

                  return ListView.builder(
                    itemCount: openingProvider.openings.length,
                    itemBuilder: (context, index) {
                      final opening = openingProvider.openings[index];
                      return OpeningCard(
                        title: opening.name,
                        ecoCode: opening.eco,
                        onTap: () {}, // Dikosongkan dulu untuk Tahap 8
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
