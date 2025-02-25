// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  String name;
  Address address;
  DateTime registerAt;
  String contact;
  String fcm_token="";

  UserProfile({
    this.name,
    this.address,
    this.registerAt,
    this.contact,
    this.fcm_token
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        name: json["name"],
        address: Address.fromJson(json["address"]),
        registerAt: DateTime.parse(json["registerAt"]),
        contact: json["contact"],
        fcm_token: json["fcm_token"]??""
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address.toJson(),
        "registerAt": registerAt.toIso8601String(),
        "contact": contact,
        "fcm_token":fcm_token
      };
}

class Address {
  String address;
  String landmark;
  UserLocation userLocation;
  String houseNo;
  String city;
  String building;
  String cityUser, state, pincode;

  Address(
      {this.address,
      this.landmark,
      this.userLocation,
      this.houseNo,
      this.city,
      this.building,
      this.state,
      this.pincode,
      this.cityUser});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
      address: json["address"],
      landmark: json["landmark"],
      userLocation: UserLocation.fromJson(json["userLocation"]),
      houseNo: json["houseNo"],
      city: json["city"],
      cityUser: json["cityUser"] ?? "",
      building: json["building"],
      pincode: json["pincode"] ?? "",
      state: json["state"] ?? "");

  Map<String, dynamic> toJson() => {
        "address": address,
        "landmark": landmark,
        "userLocation": userLocation.toJson(),
        "houseNo": houseNo,
        "city": city,
        "cityUser": cityUser,
        "building": building,
        "pincode": pincode,
        "state": state
      };
}

class UserLocation {
  double latitude;
  double longitude;

  UserLocation({
    this.latitude,
    this.longitude,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
