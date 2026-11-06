import '../models/opening_model.dart';
import '../services/api_service.dart';

class OpeningRepository {
  final ApiService _apiService = ApiService();

  Future<List<OpeningModel>> getOpenings() async {
    return await _apiService.fetchOpenings();
  }
}
