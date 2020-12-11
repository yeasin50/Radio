import 'package:flutter/material.dart';
import 'package:radio/model/radio.dart';

class RowTemplate extends StatefulWidget {
  final RadioModel radio;
  RowTemplate({Key key, this.radio}) : super(key: key);

  @override
  _RowTemplateState createState() => _RowTemplateState();
}

class _RowTemplateState extends State<RowTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSongRow(),
    );
  }

  Widget _buildSongRow() {
    return ListTile(
      title: Text(
        this.widget.radio.radioName,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
      // leading: _image(widget.radio.radioIMG, size: 40.4),
      leading: Icon(Icons.dangerous),
      subtitle: Text(
        widget.radio.radioDescription,
        maxLines: 2,
      ),
      trailing: Wrap(
        spacing: -10,
        runSpacing: 0.0,
        children: [
          _buildPlayStopButton(),
          _buildAddFavButton(),
        ],
      ),
    );
  }

  Widget _image(String url, {double size}) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(url),
      ),
      height: size == null ? 55 : size,
      width: size == null ? 55 : size,
      decoration: BoxDecoration(
          color: Colors.red.withAlpha(12),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(12),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ]),
    );
  }

  _buildAddFavButton() {
    return IconButton(
      icon: Icon(Icons.favorite_border),
      onPressed: () {},
    );
  }

  _buildPlayStopButton() {
    return IconButton(
      icon: Icon(Icons.play_circle_filled),
      onPressed: () {},
    );
  }
}
