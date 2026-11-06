class OpeningModel {
  final String eco;
  final String name;
  final String pgn;

  OpeningModel({required this.eco, required this.name, required this.pgn});

  factory OpeningModel.fromJson(Map<String, dynamic> json) {
    return OpeningModel(
      eco: json['eco'] ?? 'Unknown',
      name: json['name'] ?? 'Unknown Opening',
      pgn: json['pgn'] ?? '',
    );
  }
}
