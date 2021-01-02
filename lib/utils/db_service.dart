import 'dart:developer';

import 'package:radio/model/bd_model.dart';
import 'package:radio/model/radio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

abstract class DB {
  static String keyID = "ID";
  static String keyRadioName = "RadioName";
  static String keyRadioUrl = "RadioURL";
  static String keyRadioDesc = 'RadioDesc';
  static String keyRadioWebsite = 'RadioWebsite';
  static String keyRadioImg = 'RadioPic';
  static String keyIsFav = 'isFavorite';
  static String table = "radios";
  static String table_fav = 'favoriteChannel';

  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    log("DB init()");
    if (_db != null) {
      log("DB not null");
      return;
    }

    try {
      var databasesPath = await getDatabasesPath();
      String _path = p.join(databasesPath, 'RadioApp.db');
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table ($keyID INTEGER PRIMARY KEY NOT NULL, $keyRadioName STRING, $keyRadioUrl STRING, $keyRadioDesc STRING, $keyRadioWebsite STRING, $keyRadioImg String)');
    // await db.execute(
    //     'CREATE TABLE $table_fav ($keyID INTEGER PRIMARY KEY NOT NULL, $keyIsFav INTEGER)');
    log("DB created");
  }

  static Future<int> insertRadio(RadioModel model) async {
    var resutl = await _db.insert(table, model.toMap());
    return resutl;
  }
}
