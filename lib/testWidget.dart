import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:radio/model/radio.dart';
import 'package:radio/services/db_download.dart';

import 'package:http/http.dart' as http;

class TestWidget extends StatefulWidget {
  TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

void preViewJson() async {
  var url = "http://snippetcoder.com/AllRadios.txt";
  var response = await http.get(url);

  var jsonString = jsonDecode(response.body)["Data"] as List;
  List<RadioModel> radios =
      jsonString.map((radio) => RadioModel.fromJson(radio)).toList();
  radios.forEach((element) {
    print(" radio Name>> ${element.radioName}");
  });
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: preViewJson,
            child: Text("show json"),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("show SQL Data"),
          ),
        ],
      ),
    );
  }
}
