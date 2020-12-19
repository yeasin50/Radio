import 'dart:core';

class Model {
  int id;
  String radioName;
  String radioUrl;
  String radiodesc;
  String radioShortDesc;
  String radioPic;

  Model({
    this.id,
    this.radioName,
    this.radioUrl,
    this.radiodesc,
    this.radioShortDesc,
    this.radioPic,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        id: json['ID'],
        radioName: json['RadioName'],
        radiodesc: json["RadioDesc"],
        radioUrl: json["RadioURL"],
        radioShortDesc: json["RadioShortDesc"],
        radioPic: json["RadioPic"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "RadioName": radioName,
      "RadioDesc": radiodesc,
      "RadioURL": radioUrl,
      "RadioShortDesc": radioShortDesc,
      "RadioPic": radioPic
    };
  }
}
