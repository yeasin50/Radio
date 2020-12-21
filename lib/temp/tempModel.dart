import 'dart:convert';
import 'dart:core';

class Model {
  String id;
  String radioName;
  String radioUrl;
  String radiodesc;
  String radioShortDesc;
  String radioWebsite;
  String radioPic;

  Model({
    this.id,
    this.radioName,
    this.radioUrl,
    this.radiodesc,
    this.radioShortDesc,
    this.radioWebsite,
    this.radioPic,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        id: json['ID'],
        radioName: json['RadioName'],
        radiodesc: json["RadioDesc"],
        radioUrl: json["RadioURL"],
        radioShortDesc: json["RadioShortDesc"],
        radioWebsite: json["RadioWebsite"],
        radioPic: json["RadioPic"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "RadioName": radioName,
      "RadioDesc": radiodesc,
      "RadioURL": radioUrl,
      "RadioShortDesc": radioShortDesc,
      "RadioWebsite": radioWebsite,
      "RadioPic": radioPic,
    };
  }
}

String jsonString =
    '"Data":[ { "ID":53, "RadioName":"Desi World Radio", "RadioURL":"http://stream.zenolive.com/4mbfcn4mf24tv",  "RadioDesc":"The Desi World Radio is introducing an internet radio that can access more than 500 Desi radio stations in over 150 countries around the world with no monthly fees.", "RadioShortDesc":null,"RadioWebsite":"http://www.desiworldradio.com", "RadioPic":"url.com/RadioPics/53.png?dt=2515202008:15:14" }';

main(List<String> args) {
  Map<String, dynamic> map = jsonDecode(jsonString)["Data"];

  
}
