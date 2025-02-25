// To parse this JSON data, do
//
//     final fabricShops = fabricShopsFromJson(jsonString);

import 'dart:convert';

List<FabricShops> fabricShopsFromJson(String str) => List<FabricShops>.from(json.decode(str).map((x) => FabricShops.fromJson(x)));

String fabricShopsToJson(List<FabricShops> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FabricShops {
    String created;
    String userImage;
    String name;
    String shopName;
    String contact;
    String city;
    String address;
    String shopVariety;
    List<String> specialisation;
    List<String> fabricSample;

    FabricShops({
        this.created,
        this.userImage,
        this.name,
        this.shopName,
        this.contact,
        this.city,
        this.address,
        this.shopVariety,
        this.specialisation,
        this.fabricSample,
    });

    factory FabricShops.fromJson(Map<String, dynamic> json) => FabricShops(
        created: json["created"],
        userImage: json["userImage"],
        name: json["name"],
        shopName: json["shopName"],
        contact: json["contact"],
        city: json["city"],
        address: json["address"],
        shopVariety: json["shopVariety"],
        specialisation: List<String>.from(json["specialisation"].map((x) => x)),
        fabricSample: List<String>.from(json["fabricSample"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "created": created,
        "userImage": userImage,
        "name": name,
        "shopName": shopName,
        "contact": contact,
        "city": city,
        "address": address,
        "shopVariety": shopVariety,
        "specialisation": List<dynamic>.from(specialisation.map((x) => x)),
        "fabricSample": List<dynamic>.from(fabricSample.map((x) => x)),
    };
}
