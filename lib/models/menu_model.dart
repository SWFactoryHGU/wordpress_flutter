class MenuModel {
  int id;
  String title;
  String info;
  String link;
  double price;
  String image;
  String thumbnail;

  MenuModel(this.id, this.title, this.info, this.link, this.price, this.image,
      this.thumbnail);

  MenuModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = (parsedJson['title'])['rendered'];
    info = (parsedJson['info']);
    link = parsedJson['link'];
    price = parsedJson['price'];
    image = parsedJson['image'];
    thumbnail = parsedJson['thumbnail'];
  }
}
