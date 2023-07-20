import 'dart:convert';


class Datum {
    String title;
    String author;
    String year;
    Language language;
    String downloadSize;
    String totalPage;
    Format format;
    String md5;

    Datum({
        required this.title,
        required this.author,
        required this.year,
        required this.language,
        required this.downloadSize,
        required this.totalPage,
        required this.format,
        required this.md5,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        author: json["author"],
        year: json["year"],
        language: languageValues.map[json["language"]]!,
        downloadSize: json["download_size"],
        totalPage: json["total_page"],
        format: formatValues.map[json["format"]]!,
        md5: json["md5"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "year": year,
        "language": languageValues.reverse[language],
        "download_size": downloadSize,
        "total_page": totalPage,
        "format": formatValues.reverse[format],
        "md5": md5,
    };
}

enum Format { PDF, CHM }

final formatValues = EnumValues({
    "chm": Format.CHM,
    "pdf": Format.PDF
});

enum Language { ENGLISH, SPANISH, GERMAN }

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "German": Language.GERMAN,
    "Spanish": Language.SPANISH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
