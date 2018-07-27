class PostModel {
  int id;
  String title;
  String content;
  String excerpt;
  String link;
  int featuredMedia;

  PostModel(this.id, this.title, this.content, this.excerpt, this.link,
      this.featuredMedia);

  PostModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = (parsedJson['title'])['rendered'];
    content = (parsedJson['content'])['rendered'];
    excerpt = (parsedJson['excerpt'])['rendered'];
    link = parsedJson['link'];
    featuredMedia = parsedJson['featured_media'];
  }
}
