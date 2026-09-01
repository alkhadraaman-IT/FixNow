import 'dart:convert';

class UserModel {
    final int? id;
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? city;
    final String? country;
    final String? image;

    UserModel({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.city,
        this.country,
        this.image,
    });

    UserModel copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? email,
        String? city,
        String? country,
        String? image,
    }) => 
        UserModel(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            city: city ?? this.city,
            country: country ?? this.country,
            image: image ?? this.image,
        );

    factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        city: json["city"],
        country: json["country"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "city": city,
        "country": country,
        "image": image,
    };
}
