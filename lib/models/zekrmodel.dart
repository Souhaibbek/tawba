// ignore_for_file: file_names

class ZekrModel {
  const ZekrModel({
    required this.zekr,
    required this.desc,
    required this.ref,
    required this.countNumber,
    required this.count,
  });
  final String zekr;
  final String desc;
  final String ref;
  final int countNumber;
  final String count;

  factory ZekrModel.fromJson(Map<String, dynamic> json) {
    return ZekrModel(
      zekr: json['zekr'],
      desc: json['description'],
      ref: json['reference'],
      countNumber: json['int'],
      count: json['count'],
    );
  }
}
