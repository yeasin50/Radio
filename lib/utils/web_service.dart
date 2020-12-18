import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:radio/model/base_model.dart';

class WebService {
  Future<BaseModel> getData(String url, BaseModel baseModel) async {
    final response = await http.get(url);
    log("fetching data from webServer");

    if (response.statusCode == 200) {
      baseModel.fromJson(json.decode(response.body));
      return baseModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
