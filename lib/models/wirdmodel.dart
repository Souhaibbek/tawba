class WirdModel {
  final String text;
  final int counter;
  final String count;

  const WirdModel({
    required this.count,
    required this.text,
    required this.counter,
  });

  factory WirdModel.fromJson(Map<String, dynamic> json) {
    return WirdModel(
      text: json['text'] ?? '',
      counter: json['counter'] ?? 0,
      count: json['count'] ?? '',
    );
  }
}
