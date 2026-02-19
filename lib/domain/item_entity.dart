class ItemEntity {
  String title;
  String imageUrl;
  String description;

  ItemEntity(this.title, this.imageUrl, this.description);

  Uri fetchImageUrl() {
    return Uri(scheme: this.imageUrl);

  }
}
