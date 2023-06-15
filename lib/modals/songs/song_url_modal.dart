// To parse this JSON data, do
//
//     final songUrl = songUrlFromJson(jsonString);

import 'dart:convert';

SongUrl songUrlFromJson(String str) => SongUrl.fromJson(json.decode(str));

String songUrlToJson(SongUrl data) => json.encode(data.toJson());

class SongUrl {
  List<Datum>? data;

  SongUrl({
    this.data,
  });

  factory SongUrl.fromJson(Map<String, dynamic> json) => SongUrl(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? url;

  Datum({
    this.id,
    this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
