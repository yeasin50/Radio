import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
  final String title, imgUrl;

  const NowPlaying({Key key, this.title, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.pink,
            child: _nowPlaying(context, title, "a"),
          ),
        ],
      ),
    );
  }

  Widget _nowPlaying(BuildContext context, String title, String url) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: ListTile(
        // leading: Icon(Icons.radio),
        leading: Image.network("https://www.101languages.net/images/radio/radio15.png",width: 40,),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Now Playing",
          textScaleFactor: .8,
        ),
        trailing: Wrap(
          spacing: -10,
          runSpacing: 0.0,
          children: [
            _buildPlayStopButton(),
            _buildShareButton(),
          ],
        ),
      ),
    );
  }

  _buildShareButton() {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () {},
    );
  }

  _buildPlayStopButton() {
    return IconButton(
      icon: Icon(Icons.stop),
      onPressed: () {},
    );
  }
}
