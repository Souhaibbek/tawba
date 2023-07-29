class GodNamesModel {
  final String name;
  final String descText;

  const GodNamesModel({
    required this.name,
    required this.descText,
  });

  factory GodNamesModel.fromJson(Map<String, dynamic> json) {
    return GodNamesModel(
      name: json['name'] ?? '',
      descText: json['text'] ?? '',
    );
  }
}
