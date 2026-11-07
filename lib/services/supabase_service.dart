import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/repertoire_model.dart';

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> insertRepertoire(RepertoireModel repertoire) async {
    try {
      await _supabase.from('repertoires').insert(repertoire.toJson());
    } catch (e) {
      throw Exception('Gagal menyimpan data: ${e.toString()}');
    }
  }

  Future<List<RepertoireModel>> fetchRepertoires() async {
    try {
      final response = await _supabase
          .from('repertoires')
          .select()
          .order('created_at', ascending: false);

      return (response as List)
          .map((item) => RepertoireModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Gagal mengambil data: ${e.toString()}');
    }
  }
}
