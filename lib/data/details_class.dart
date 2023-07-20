import 'dart:convert';


class Data {
    String title;
    String thumbnail;
    String downloadLink;
    String desc;

    Data({
        required this.title,
        required this.thumbnail,
        required this.downloadLink,
        required this.desc,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        thumbnail: json["thumbnail"],
        downloadLink: json["download_link"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnail": thumbnail,
        "download_link": downloadLink,
        "desc": desc,
    };
}
