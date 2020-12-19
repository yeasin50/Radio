import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import './tempModel.dart';

void getData(String url) async {
  final res = await http.get(url);
  print(res.statusCode);
}

Future<List<Model>> fetchData(String url) async {
  final res = await http.get(url);

  print(res.statusCode);
  // var jsonBody = jsonDecode(res.body);

  var data = jsonDecode(res.body);
  // print(data.toString());
  log("On fetchData");

  List<Model> models = data.map((data) => Model.fromJson(data)).toList();
  return models;
}

main() {
  var url = "http://snippetcoder.com/AllRadios.txt";
  // getData(url);
  var data = fetchData(url);
  print(data.runtimeType);
}
