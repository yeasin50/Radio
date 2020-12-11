import 'package:flutter/material.dart';
import 'package:radio/model/radio.dart';
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
    radioIMG:
        "https://d3n8a8pro7vhmx.cloudfront.net/cjfe/pages/1180/attachments/original/1460475737/radio.jpg",
    isFavorite: false,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          appBar(),
          buildRowTemplates(),
          NowPlaying(title: "rara", imgUrl: "23"),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("Radio"),
    );
  }

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
                    "https://d3n8a8pro7vhmx.cloudfront.net/cjfe/pages/1180/attachments/original/1460475737/radio.jpg",
                isFavorite: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
