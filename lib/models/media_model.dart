class MediaModel {
  int id;
  String title;
  String sourceUrl;
  String thumbnail;

  MediaModel(this.id, this.title, this.sourceUrl, this.thumbnail);

  MediaModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = (parsedJson['title'])['rendered'];
    sourceUrl = parsedJson['source_url'];
    thumbnail = (((parsedJson['media_details'])['sizes'])['thumbnail'])['source_url'];
  }
}
