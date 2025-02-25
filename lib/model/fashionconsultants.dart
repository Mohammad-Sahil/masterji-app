// To parse this JSON data, do
//
//     final fashionConsultants = fashionConsultantsFromJson(jsonString);

import 'dart:convert';

List<FashionConsultants> fashionConsultantsFromJson(String str) =>
    List<FashionConsultants>.from(
        json.decode(str).map((x) => FashionConsultants.fromJson(x,x['userId'])));

String fashionConsultantsToJson(List<FashionConsultants> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FashionConsultants {
  String userId;
  String city;
  String contact;
  String email;
  String expertise;
  String name;
  int rate;
  String userImage;
  String workExperience;
  List<String> workSample;

  FashionConsultants({
    this.userId,
    this.city,
    this.contact,
    this.email,
    this.expertise,
    this.name,
    this.rate,
    this.userImage,
    this.workExperience,
    this.workSample,
  });

  factory FashionConsultants.fromJson(
          Map<String, dynamic> json, String userId) =>
      FashionConsultants(
        userId: userId,
        city: json["city"],
        contact: json["contact"],
        email: json["email"],
        expertise: json["expertise"],
        name: json["name"],
        rate: json["rate"],
        userImage: json["userImage"],
        workExperience: json["workExperience"],
        workSample: List<String>.from(json["workSample"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "city": city,
        "contact": contact,
        "email": email,
        "expertise": expertise,
        "name": name,
        "rate": rate,
        "userImage": userImage,
        "workExperience": workExperience,
        "workSample": List<dynamic>.from(workSample.map((x) => x)),
      };
}
