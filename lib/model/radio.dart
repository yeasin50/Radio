import 'dart:convert';

import 'package:radio/model/base_model.dart';
import 'package:radio/model/bd_model.dart';
import 'package:radio/utils/db_service.dart';

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
        id: map[DB.keyID],
        isFavorite: false,
        radioDescription: map[DB.keyRadioDesc],
        radioIMG: map[DB.keyRadioName],
        radioName: map[DB.keyRadioName],
        radioURL: map[DB.keyRadioUrl],
        radioWebSite: map[DB.keyRadioWebsite]);
  }


  //for sqlFlite
   static RadioModel fromMap(Map<String, dynamic> map) {
    return RadioModel(
      id: map[DB.keyID],
      radioName: map[DB.keyRadioName],
      radioURL: map[DB.keyRadioUrl],
      radioDescription: map[DB.keyRadioDesc],
      radioWebSite: map[DB.keyRadioWebsite],
      radioIMG: map[DB.keyRadioWebsite],
      isFavorite: map[DB.keyIsFav] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      DB.keyRadioName: radioName,
      DB.keyRadioUrl: radioURL,
      DB.keyRadioDesc: radioDescription,
      DB.keyRadioWebsite: radioWebSite,
      DB.keyRadioName: radioIMG
    };

    if (id != null) {
      map[DB.keyID] = id;
    }
    return map;
  }
}
