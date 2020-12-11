class RadioModel {
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
}
