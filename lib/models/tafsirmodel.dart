class TafsirModel {
  final String text;
  final int aya;
  final int sura;
  final int index;

  const TafsirModel({
    required this.aya,
    required this.sura,
    required this.index,
    required this.text,
  });

  factory TafsirModel.fromJson(Map<String, dynamic> json) {
    return TafsirModel(
      text: json['text'] ?? '',
      aya: json['aya'] ?? 0,
      sura: json['sura'] ?? 0,
      index: json['index'] ?? 0,
    );
  }
}
