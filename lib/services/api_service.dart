import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/opening_model.dart';

class ApiService {
  final String baseUrl = 'https://6aeeaffba677fe0fc14ffe70.mockapi.io/openings';

  Future<List<OpeningModel>> fetchOpenings() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final dynamic decodedData = jsonDecode(response.body);

        if (decodedData is! List) {
          throw Exception('Data dari API bukan berupa List!');
        }

        List<OpeningModel> openings = [];

        for (var item in decodedData) {
          if (item is Map<String, dynamic>) {
            openings.add(
              OpeningModel(
                eco: item['eco']?.toString() ?? '-',
                name: item['name']?.toString() ?? 'Unknown',
                pgn: item['pgn']?.toString() ?? '',
              ),
            );
          } else if (item is List) {
            for (var subItem in item) {
              if (subItem is Map<String, dynamic>) {
                openings.add(
                  OpeningModel(
                    eco: subItem['eco']?.toString() ?? '-',
                    name: subItem['name']?.toString() ?? 'Unknown',
                    pgn: subItem['pgn']?.toString() ?? '',
                  ),
                );
              }
            }
          }
        }

        debugPrint('=== TOTAL DATA BERHASIL DIPARSING: ${openings.length} ===');
        return openings;
      } else {
        throw Exception('Gagal memuat data (Status: ${response.statusCode})');
      }
    } catch (e) {
      debugPrint('=== ERROR: $e ===');
      throw Exception('Error: ${e.toString()}');
    }
  }
}
