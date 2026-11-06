import 'package:flutter/material.dart';

import '../models/opening_model.dart';

class OpeningProvider with ChangeNotifier {
  bool _isLoading = false;
  List<OpeningModel> _openings = [];
  String? _errorMessage;

  bool get isLoading => _isLoading;
  List<OpeningModel> get openings => _openings;
  String? get errorMessage => _errorMessage;

  Future<void> fetchOpenings() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulasi jeda jaringan (2 detik)
      await Future.delayed(const Duration(seconds: 2));

      _openings = [
        OpeningModel(eco: 'B20', name: 'Sicilian Defense', pgn: '1. e4 c5'),
        OpeningModel(eco: 'D06', name: "Queen's Gambit", pgn: '1. d4 d5 2. c4'),
        OpeningModel(
          eco: 'C50',
          name: 'Italian Game',
          pgn: '1. e4 e5 2. Nf3 Nc6 3. Bc4',
        ),
      ];
    } catch (e) {
      _errorMessage = 'Gagal memuat data: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
