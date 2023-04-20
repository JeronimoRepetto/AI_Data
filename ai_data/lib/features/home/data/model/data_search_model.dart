import 'dart:convert';

class DataSearch {
  DataSearch({
    required this.name,
    this.info,
  });
  String name;
  String? info;

  String toJson() => json.encode(toMap());

  factory DataSearch.fromMap(Map<String, dynamic> json) => DataSearch(
        name: json['name'],
        info: json['info'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'info': info,
      };
}
