import 'package:fintech_app/data/product_response_model.dart';

class ItemEntity {
  String title;
  String imageUrl;
  String description;

  ItemEntity(this.title, this.imageUrl, this.description);

  ItemEntity.product(ProductResponseModel productResponseModel){

    ItemEntity(productResponseModel.title, productResponseModel.image, productResponseModel.description);
    // this.title = productResponseModel.title;
    // this.imageUrl = productResponseModel.image;
    // this.description = productResponseModel.description;
  }

  Uri fetchImageUrl() {
    return Uri(scheme: this.imageUrl);

  }
}
