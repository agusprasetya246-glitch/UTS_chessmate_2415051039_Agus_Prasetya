import 'package:flutter/material.dart';

import '../models/opening_model.dart';
import '../repositories/opening_repository.dart';

class OpeningProvider with ChangeNotifier {
  final OpeningRepository _repository = OpeningRepository();

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
      // Panggil API melalui Repository
      _openings = await _repository.getOpenings();
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
