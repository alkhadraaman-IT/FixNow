import 'dart:convert';

import 'provider_model.dart';

class ServicesModel {
    final int? id;
    final String? name;
    final String? description;
    final String? category;
    final int? price;
    final String? image;
    final double? rating;
    final int? reviewCount;
    final List<String>? includes;
    final ProviderModel? provider;

    ServicesModel({
        this.id,
        this.name,
        this.description,
        this.category,
        this.price,
        this.image,
        this.rating,
        this.reviewCount,
        this.includes,
        this.provider,
    });

    ServicesModel copyWith({
        int? id,
        String? name,
        String? description,
        String? category,
        int? price,
        String? image,
        double? rating,
        int? reviewCount,
        List<String>? includes,
        ProviderModel? provider,
    }) => 
        ServicesModel(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            category: category ?? this.category,
            price: price ?? this.price,
            image: image ?? this.image,
            rating: rating ?? this.rating,
            reviewCount: reviewCount ?? this.reviewCount,
            includes: includes ?? this.includes,
            provider: provider ?? this.provider,
        );

    factory ServicesModel.fromJson(String str) => ServicesModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ServicesModel.fromMap(Map<String, dynamic> json) => ServicesModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        price: json["price"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        reviewCount: json["review_count"],
        includes: json["includes"] == null ? [] : List<String>.from(json["includes"]!.map((x) => x)),
        provider: json["provider"] == null ? null : ProviderModel.fromMap(json["provider"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "price": price,
        "image": image,
        "rating": rating,
        "review_count": reviewCount,
        "includes": includes == null ? [] : List<dynamic>.from(includes!.map((x) => x)),
        "provider": provider?.toMap(),
    };
}

