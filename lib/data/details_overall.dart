import 'dart:convert';
import '../data/details_class.dart';

class DetailsOverall {
    bool status;
    String msg;
    Data data;

    DetailsOverall({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory DetailsOverall.fromRawJson(String str) => DetailsOverall.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailsOverall.fromJson(Map<String, dynamic> json) => DetailsOverall(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}