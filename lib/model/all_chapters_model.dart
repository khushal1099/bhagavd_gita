// To parse this JSON data, do
//
//     final allchaptersModel = allchaptersModelFromJson(jsonString);

import 'dart:convert';

List<AllchaptersModel> allchaptersModelFromJson(String str) => List<AllchaptersModel>.from(json.decode(str).map((x) => AllchaptersModel.fromJson(x)));

String allchaptersModelToJson(List<AllchaptersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllchaptersModel {
  int? chapterNumber;
  String? chapterSummary;
  String? chapterSummaryHindi;
  int? id;
  String? name;
  String? nameMeaning;
  String? nameTranslation;
  int? versesCount;
  String? jsonPath;
  String? image;
  List<Verse>? verses;

  AllchaptersModel({
    this.chapterNumber,
    this.chapterSummary,
    this.chapterSummaryHindi,
    this.id,
    this.name,
    this.nameMeaning,
    this.nameTranslation,
    this.versesCount,
    this.jsonPath,
    this.image,
    this.verses,
  });

  factory AllchaptersModel.fromJson(Map<String, dynamic> json) => AllchaptersModel(
    chapterNumber: json["chapter_number"],
    chapterSummary: json["chapter_summary"],
    chapterSummaryHindi: json["chapter_summary_hindi"],
    id: json["id"],
    name: json["name"],
    nameMeaning: json["name_meaning"],
    nameTranslation: json["name_translation"],
    versesCount: json["verses_count"],
    jsonPath: json["json_path"],
    image: json["image"],
    verses: json["verses"] == null ? [] : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "chapter_number": chapterNumber,
    "chapter_summary": chapterSummary,
    "chapter_summary_hindi": chapterSummaryHindi,
    "id": id,
    "name": name,
    "name_meaning": nameMeaning,
    "name_translation": nameTranslation,
    "verses_count": versesCount,
    "json_path": jsonPath,
    "image": image,
    "verses": verses == null ? [] : List<dynamic>.from(verses!.map((x) => x.toJson())),
  };
}

class Verse {
  String? verse;
  String? san;
  String? en;
  String? guj;
  String? hi;

  Verse({
    this.verse,
    this.san,
    this.en,
    this.guj,
    this.hi,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    verse: json["verse"],
    san: json["san"],
    en: json["en"],
    guj: json["guj"],
    hi: json["hi"],
  );

  Map<String, dynamic> toJson() => {
    "verse": verse,
    "san": san,
    "en": en,
    "guj": guj,
    "hi": hi,
  };
}
