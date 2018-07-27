class MediaModel {
  int id;
  String title;
  String source_url;
  String thumbnail;

  MediaModel(this.id, this.title, this.source_url, this.thumbnail);

  MediaModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = (parsedJson['title'])['rendered'];
    source_url = parsedJson['source_url'];
    thumbnail = (((parsedJson['media_details'])['sizes'])['thumbnail'])['source_url'];
  }
}
