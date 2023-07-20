import 'dart:convert';
import 'book_class.dart';

class OverallResponse {
    bool status;
    String msg;
    List<Datum> data;

    OverallResponse({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory OverallResponse.fromRawJson(String str) => OverallResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OverallResponse.fromJson(Map<String, dynamic> json) => OverallResponse(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}