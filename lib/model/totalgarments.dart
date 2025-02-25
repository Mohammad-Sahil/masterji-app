// To parse this JSON data, do
//
//     final totalGarments = totalGarmentsFromJson(jsonString);

import 'dart:convert';

TotalGarments totalGarmentsFromJson(String str) =>
    TotalGarments.fromJson(json.decode(str));

String totalGarmentsToJson(TotalGarments data) => json.encode(data.toJson());

class TotalGarments {
  String prePaymentId = "";
  String commentData;
  String bookingDate;
  String bookingTime;
  String phoneNumber;
  String orderDate;
  String orderId;
  String currentStatus;
  Address address;
  List<RfOrderItem> rfOrderItem;

  TotalGarments(
      {this.commentData,
      this.bookingDate,
      this.bookingTime,
      this.phoneNumber,
      this.orderDate,
      this.orderId,
      this.currentStatus,
      this.address,
      this.rfOrderItem,
      this.prePaymentId});

  factory TotalGarments.fromJson(Map<String, dynamic> json) => TotalGarments(
        commentData: json["commentData"],
        bookingDate: json["bookingDate"],
        bookingTime: json["bookingTime"],
        phoneNumber: json["phoneNumber"],
        orderDate: json["orderDate"],
        orderId: json["orderID"],
        currentStatus: json["currentStatus"],
        address: Address.fromJson(json["address"]),
        prePaymentId: json["prePaymentId"] ?? "",
        rfOrderItem: List<RfOrderItem>.from(
            json["RfOrderItem"].map((x) => RfOrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "commentData": commentData,
        "bookingDate": bookingDate,
        "bookingTime": bookingTime,
        "phoneNumber": phoneNumber,
        "orderDate": orderDate,
        "orderID": orderId,
        "currentStatus": currentStatus,
        "prePaymentId": prePaymentId,
        "address": address.toJson(),
        "RfOrderItem": List<dynamic>.from(rfOrderItem.map((x) => x.toJson())),
      };
}

class Address {
  String address;
  String building;
  String city;
  String houseNo;
  String landmark;

  Address({
    this.address,
    this.building,
    this.city,
    this.houseNo,
    this.landmark,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        building: json["building"],
        city: json["city"],
        houseNo: json["houseNo"],
        landmark: json["landmark"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "building": building,
        "city": city,
        "houseNo": houseNo,
        "landmark": landmark,
      };
}

class RfOrderItem {
  int workType = 0;
  Pricing pricing;
  String garmentId;
  List<Category> stitchingCategory;
  RfGarmentDetails garmentDetails;
  List<Category> selectedCategory;

  RfOrderItem(
      {this.pricing,
      this.garmentId,
      this.stitchingCategory,
      this.garmentDetails,
      this.selectedCategory,
      this.workType});

  factory RfOrderItem.fromJson(Map<String, dynamic> json) => RfOrderItem(
        pricing: Pricing.fromJson(json["pricing"]),
        garmentId: json["garmentId"],
        workType: json["workType"] ?? 0,
        stitchingCategory: List<Category>.from(
            json["stitching_category"].map((x) => Category.fromJson(x))),
        garmentDetails: RfGarmentDetails.fromJson(json["garment_details"]),
        selectedCategory: List<Category>.from(
            json["selected_category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pricing": pricing.toJson(),
        "garmentId": garmentId,
        "workType": workType,
        "stitching_category":
            List<dynamic>.from(stitchingCategory.map((x) => x.toJson())),
        "garment_details": garmentDetails.toJson(),
        "selected_category":
            List<dynamic>.from(selectedCategory.map((x) => x.toJson())),
      };
}

class RfGarmentDetails {
  String icon;
  String garmentType;
  String category;

  RfGarmentDetails({
    this.icon,
    this.garmentType,
    this.category,
  });

  factory RfGarmentDetails.fromJson(Map<String, dynamic> json) =>
      RfGarmentDetails(
        icon: json["icon"],
        garmentType: json["garment_type"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "garment_type": garmentType,
        "category": category,
      };
}

class Pricing {
  int alterPrice;
  int stitchPrice;
  int totalPrice;
  int addOnPrice;

  Pricing({
    this.alterPrice,
    this.stitchPrice,
    this.totalPrice,
    this.addOnPrice,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        alterPrice: json["alter_price"],
        stitchPrice: json["stitch_price"],
        totalPrice: json["total_price"],
        addOnPrice: json["add_on_price"],
      );

  Map<String, dynamic> toJson() => {
        "alter_price": alterPrice,
        "stitch_price": stitchPrice,
        "total_price": totalPrice,
        "add_on_price": addOnPrice,
      };
}

class Category {
  String category;
  String subCategory;
  int price;

  Category({
    this.category,
    this.subCategory,
    this.price,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        category: json["category"],
        subCategory: json["sub_category"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "sub_category": subCategory,
        "price": price,
      };
}
