import 'package:http/http.dart' as http;
import 'book_class.dart';
import 'details_class.dart';
import 'details_overall.dart';
import 'overall_response.dart';

Future<List<Datum>> bookApiCall(String books) async {
  String apiUrl =
      "https://libgen-api.onrender.com/?search=$books";
  final url = Uri.parse(apiUrl);
  var response = await http.get(url);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    var jsonRes = OverallResponse.fromRawJson(response.body);
    return jsonRes.data;
  } else {
    throw ("Something went wrong ${response.statusCode}");
  }
}

Future<Data> detailsApiCall(String details) async {
  String apiUrl =
      "https://libgen-api.onrender.com/detail?md5=$details";
  final url = Uri.parse(apiUrl);
  var response = await http.get(url);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    var jsonRes = DetailsOverall.fromRawJson(response.body);
    return jsonRes.data;
  } else {
    throw ("Something went wrong ${response.statusCode}");
  }
}