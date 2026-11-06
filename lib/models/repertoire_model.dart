class RepertoireModel {
  final String? id;
  final String openingName;
  final String ecoCode;
  final String masteryLevel;
  final String personalNotes;

  RepertoireModel({
    this.id,
    required this.openingName,
    required this.ecoCode,
    required this.masteryLevel,
    required this.personalNotes,
  });

  // Mengubah JSON dari Supabase ke Object Dart (Untuk Read)
  factory RepertoireModel.fromJson(Map<String, dynamic> json) {
    return RepertoireModel(
      id: json['id']?.toString(),
      openingName: json['opening_name'] as String,
      ecoCode: json['eco_code'] as String,
      masteryLevel: json['mastery_level'] as String,
      personalNotes: json['personal_notes'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'opening_name': openingName,
      'eco_code': ecoCode,
      'mastery_level': masteryLevel,
      'personal_notes': personalNotes,
    };
  }
}
