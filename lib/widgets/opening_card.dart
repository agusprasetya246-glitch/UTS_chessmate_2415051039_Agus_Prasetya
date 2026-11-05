import 'package:flutter/material.dart';

class OpeningCard extends StatelessWidget {
  final String title;
  final String ecoCode;
  final VoidCallback onTap;

  const OpeningCard({
    Key? key,
    required this.title,
    required this.ecoCode,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.sports_esports, color: Colors.brown),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('ECO Code: $ecoCode'),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
