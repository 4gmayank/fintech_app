/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ProductResponseModel productResponseModelFromJson(String str) => ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) => json.encode(data.toJson());

class ProductResponseModel {
    ProductResponseModel({
        required this.image,
        required this.price,
        required this.rating,
        required this.description,
        required this.id,
        required this.title,
        required this.category,
    });

    String image;
    double price;
    Rating rating;
    String description;
    int id;
    String title;
    String category;

    factory ProductResponseModel.fromJson(Map<dynamic, dynamic> json) => ProductResponseModel(
        image: json["image"],
        price: json["price"]?.toDouble(),
        rating: Rating.fromJson(json["rating"]),
        description: json["description"],
        id: json["id"],
        title: json["title"],
        category: json["category"],
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "price": price,
        "rating": rating.toJson(),
        "description": description,
        "id": id,
        "title": title,
        "category": category,
    };
}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    double rate;
    int count;

    factory Rating.fromJson(Map<dynamic, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<dynamic, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
