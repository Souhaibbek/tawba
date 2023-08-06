class QuranModel {
  final String title;
  final int count;
  final String type;
  final int page;

  const QuranModel({
    required this.page,
    required this.type,
    required this.title,
    required this.count,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      title: json['titleAr'] ?? '',
      count: json['count'] ?? 0,
      type: json['type'] ?? '',
      page: int.parse(json['pages']),
    );
  }
}
