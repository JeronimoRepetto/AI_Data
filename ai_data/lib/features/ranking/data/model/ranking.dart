import 'dart:convert';

class RankingModel {
  RankingModel({required this.name, required this.info});

  String name;
  String info;

  String toJson() => json.encode(toMap());

  factory RankingModel.fromMap(Map<String, dynamic> json) => RankingModel(
        name: json['name'],
        info: json['info'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'info': info,
      };
}
