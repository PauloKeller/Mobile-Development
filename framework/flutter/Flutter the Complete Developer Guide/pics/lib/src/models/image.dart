class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    url = json["url"];
    title = json["title"];
  }
}
