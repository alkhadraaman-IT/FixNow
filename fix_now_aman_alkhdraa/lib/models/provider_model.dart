import 'package:hive_ce_flutter/adapters.dart';

part 'provider_model.g.dart';

@HiveType(typeId: 0)
class ProviderModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? specialty;
  @HiveField(3)
  final int? experienceYears;
  @HiveField(4)
  final double? rating;
  @HiveField(5)
  final int? reviewCount;
  @HiveField(6)
  final String? image;

  ProviderModel({
    this.id,
    this.name,
    this.specialty,
    this.experienceYears,
    this.rating,
    this.reviewCount,
    this.image,
  });

  ProviderModel copyWith({
    int? id,
    String? name,
    String? specialty,
    int? experienceYears,
    double? rating,
    int? reviewCount,
    String? image,
  }) => ProviderModel(
    id: id ?? this.id,
    name: name ?? this.name,
    specialty: specialty ?? this.specialty,
    experienceYears: experienceYears ?? this.experienceYears,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
    image: image ?? this.image,
  );

  // factory ProviderModel.fromJson(String str) => ProviderModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory ProviderModel.fromMap(Map<String, dynamic> json) => ProviderModel(
    id: json["id"],
    name: json["name"],
    specialty: json["specialty"],
    experienceYears: json["experience_years"],
    rating: json["rating"]?.toDouble(),
    reviewCount: json["review_count"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "specialty": specialty,
    "experience_years": experienceYears,
    "rating": rating,
    "review_count": reviewCount,
    "image": image,
  };
}
