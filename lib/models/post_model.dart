class PostModel {
  int id;
  DateTime date;
  String title;
  String content;
  String excerpt;
  String link;
  // String featuredMedia;
  int featuredMedia;

  PostModel(this.id, this.date, this.title, this.content, this.excerpt,
      this.link, this.featuredMedia);

  PostModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    date = DateTime.parse(parsedJson['date']);
    title = (parsedJson['title'])['rendered'];
    content = (parsedJson['content'])['rendered'];
    excerpt = (parsedJson['excerpt'])['rendered'];
    link = parsedJson['link'];
    featuredMedia = parsedJson['featured_media'];
    // featuredMedia =
    //     ((((parsedJson["_embedded"])["wp:featuredmedia"])[0])["source_url"]);
  }
}
