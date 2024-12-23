// To parse this JSON data, do
//
//     final cartProductModel = cartProductModelFromJson(jsonString);

import 'dart:convert';

List<CartProductModel> cartProductModelFromJson(String str) => List<CartProductModel>.from(json.decode(str).map((x) => CartProductModel.fromJson(x)));

String cartProductModelToJson(List<CartProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartProductModel {
    String id;
    String name;
    double price;
    double originalPrice;
    String color;
    String size;
    int stock;
    double rating;
    int reviews;
    String image;
    String description;
    String badge;

    CartProductModel({
        required this.id,
        required this.name,
        required this.price,
        required this.originalPrice,
        required this.color,
        required this.size,
        required this.stock,
        required this.rating,
        required this.reviews,
        required this.image,
        required this.description,
        required this.badge,
    });

    factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        originalPrice: json["originalPrice"]?.toDouble(),
        color: json["color"],
        size: json["size"],
        stock: json["stock"],
        rating: json["rating"]?.toDouble(),
        reviews: json["reviews"],
        image: json["image"],
        description: json["description"],
        badge: json["badge"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "originalPrice": originalPrice,
        "color": color,
        "size": size,
        "stock": stock,
        "rating": rating,
        "reviews": reviews,
        "image": image,
        "description": description,
        "badge": badge,
    };
}
