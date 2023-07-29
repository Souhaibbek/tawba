class HadithModel {
  final String hadithText;
  final String description;

  const HadithModel({
    required this.hadithText,
    required this.description,
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      description: json['description'] ?? '',
      hadithText: json['hadith'] ?? '',
    );
  }
}
