import 'dart:convert';

import 'package:radio/model/base_model.dart';
import 'package:radio/model/bd_model.dart';

class RadioAPIModel extends BaseModel {
  List<RadioModel> data;
  RadioAPIModel({this.data});

  fromJson(Map<String, dynamic> json) {
    this.data = (json["Data"] as List)
        .map(
          (index) => RadioModel.fromJson(index),
        )
        .toList();
  }
}

class RadioModel extends DBBaseModel {
  final int id;
  final String radioName;
  final String radioURL;
  final String radioDescription;
  final String radioWebSite;
  final String radioIMG;
  final bool isFavorite;

  RadioModel(
      {this.id,
      this.radioName,
      this.radioURL,
      this.radioDescription,
      this.radioWebSite,
      this.radioIMG,
      this.isFavorite});

//mapping with json
  factory RadioModel.fromJson(Map<String, dynamic> map) {
    return RadioModel(
        id: map["Id"],
        isFavorite: false,
        radioDescription: map["RadioDescription"],
        radioIMG: map["RadioImg"],
        radioName: map["RadioName"],
        radioURL: map["RadioUrl"],
        radioWebSite: map["RadioWebsite"]);
  }


  //for sqlFlite
   static RadioModel fromMap(Map<String, dynamic> map) {
    return RadioModel(
      id: map["id"],
      radioName: map['radioName'],
      radioURL: map['radioURL'],
      radioDescription: map['radioDesc'],
      radioWebSite: map['radioWebsite'],
      radioIMG: map['radioPic'],
      isFavorite: map['isFavourite'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'radioName': radioName,
      'radioURL': radioURL,
      'radioDesc': radioDescription,
      'radioWebsite': radioWebSite,
      'radioPic': radioIMG
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
