import 'dart:convert';


import 'package:hive_ce_flutter/adapters.dart';

import 'provider_model.dart';
part 'service_model.g.dart';

@HiveType(typeId: 1)
class ServiceModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? category;
  @HiveField(4)
  final int? price;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  final double? rating;
  @HiveField(7)
  final int? reviewCount;
  @HiveField(8)
  final List<String>? includes;
  @HiveField(9)
  final ProviderModel? provider;

  ServiceModel({
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

  ServiceModel copyWith({
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
  }) => ServiceModel(
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

  factory ServiceModel.fromJson(String str) =>
      ServiceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromMap(Map<String, dynamic> json) => ServiceModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    category: json["category"],
    price: json["price"],
    image: json["image"],
    rating: json["rating"]?.toDouble(),
    reviewCount: json["review_count"],
    includes: json["includes"] == null
        ? []
        : List<String>.from(json["includes"]!.map((x) => x)),
    provider: json["provider"] == null
        ? null
        : ProviderModel.fromMap(json["provider"]),
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
    "includes": includes == null
        ? []
        : List<dynamic>.from(includes!.map((x) => x)),
    "provider": provider?.toMap(),
  };
}
