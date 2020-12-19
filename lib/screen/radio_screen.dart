import 'package:flutter/material.dart';
import 'package:radio/model/radio.dart';
import 'package:radio/services/db_download.dart';
import 'package:radio/widget/now_playing_.dart';
import 'package:radio/widget/row_template.dart';

class RadioScreen extends StatefulWidget {
  RadioScreen({Key key}) : super(key: key);

  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  RadioModel model = RadioModel(
    id: 1,
    radioName: "Radio 1",
    radioDescription: "Description here ",
    radioIMG: "https://www.101languages.net/images/radio/radio15.png",
    isFavorite: false,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          appBar(),
          //FIXME::
          _radiosList(),
          // _radioList(),

          // buildRowTemplates(),
          // NowPlaying(title: "rara", imgUrl: "23"),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("Radio"),
    );
  }

  Widget _radiosList() {
    return new FutureBuilder(
      future: DBDownloadService.fetchLocalDB(),
      builder: (BuildContext context, AsyncSnapshot<List<RadioModel>> radios) {
        if (radios.hasData) {
          return Text("has data");
        }
        return CircularProgressIndicator();
      },
    );
  }

  // Widget _radioList() {
  //   return FutureBuilder(
  //       future: DBDownloadService.fetchLocalDB(),
  //       builder: (ctx, radios) {
  //         if (radios.hasData) {
  //           return  Expanded(
  //               child: Padding(
  //             padding: EdgeInsets.symmetric(vertical: 5),
  //             child: ListView(
  //               children: <Widget>[
  //                 ListView.separated(
  //                     itemBuilder: (_, index) {
  //                       return RowTemplate(radio: radios.data[index]);
  //                     },
  //                     separatorBuilder: (_, __) {
  //                       return Divider();
  //                     },
  //                     itemCount: radios.data.length),
  //               ],
  //             ),
  //           ));
  //         }
  //       });
  // }

  Widget buildRowTemplates() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) {
            return RowTemplate(
              radio: RadioModel(
                id: index,
                radioName: "Radio $index",
                radioDescription: "Description here ",
                radioIMG:
                    "https://www.101languages.net/images/radio/radio15.png",
                isFavorite: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
