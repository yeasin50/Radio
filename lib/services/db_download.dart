import 'dart:developer';

import 'package:radio/model/radio.dart';
import 'package:radio/utils/db_service.dart';
import 'package:radio/utils/web_service.dart';

class DBDownloadService {
  static Future<bool> isLocalDBAvailable() async {
    await DB.init();
    List<Map<String, dynamic>> _results = await DB.query(DB.table);
    return _results.length == 0 ? false : true;
  }

  static Future<RadioAPIModel> fetchAllRadios() async {
    // retriving list of radio json
    final serviceResponse = await WebService()
        .getData("http://snippetcoder.com/AllRadios.txt", new RadioAPIModel());
    return serviceResponse;
  }

  static Future<List<RadioModel>> fetchLocalDB({
    String searchQuery = "",
    bool isFavouriteOnly = false,
  }) async {
    log("fetchLocalDB");
    if (!await isLocalDBAvailable()) {
      // HTTP Call to fetch JSON Data
      RadioAPIModel radioAPIModel = await fetchAllRadios();

      //Check for data length
      if (radioAPIModel.data.length > 0) {
        //Init DB
        await DB.init();

        //ForEach api Data and Save in Local DB
        radioAPIModel.data.forEach((RadioModel radioModel) {
          DB.insert(DB.table, radioModel);
        });
      }
    }

    String rawQuery = "";

    if (!isFavouriteOnly) {
      rawQuery =
          "SELECT radios.id, radioName, radioURL, radioURL, radioDesc, radioWebsite, radioPic,"
          "isFavourite FROM radios LEFT JOIN ${DB.table_fav} ON ${DB.table_fav}.id = radios.id ";

      if (searchQuery.trim() != "") {
        rawQuery = rawQuery +
            " WHERE radioName LIKE '%$searchQuery%' OR radioDesc LIKE '%$searchQuery%' ";
      }
    } else {
      rawQuery =
          "SELECT radios.id, radioName, radioURL, radioURL, radioDesc, radioWebsite, radioPic,"
          "isFavourite FROM radios INNER JOIN ${DB.table_fav} ON ${DB.table_fav}.id = radios.id "
          "WHERE isFavourite = 1 ";

      if (searchQuery.trim() != "") {
        rawQuery = rawQuery +
            " AND radioName LIKE '%$searchQuery%' OR radioDesc LIKE '%$searchQuery%' ";
      }
    }

    List<Map<String, dynamic>> _results = await DB.rawQuery(rawQuery);

    List<RadioModel> radioModel = new List<RadioModel>();
    radioModel = _results.map((item) => RadioModel.fromMap(item)).toList();

    return radioModel;
  }
}
