// To parse this JSON data, do
//
//     final garmentModel = garmentModelFromJson(jsonString);

import 'dart:convert';

GarmentModel garmentModelFromJson(String str, String garmentId,bool cityAvailable) =>
    GarmentModel.fromJson(json.decode(str), garmentId,cityAvailable);

String garmentModelToJson(GarmentModel data) => json.encode(data.toJson());

class GarmentModel {
  String city;
  String category;
  GarmentDetails garmentDetails;
  List<StitchingCategory> stitchingCategory;
  String garmentId;
  bool cityAvailable=false;

  GarmentModel(
      {this.city,
      this.category,
      this.garmentDetails,
      this.stitchingCategory,
      this.garmentId,this.cityAvailable});

  factory GarmentModel.fromJson(Map<String, dynamic> json, String garmentId ,bool cityAvailable) =>
      GarmentModel(
        cityAvailable:cityAvailable,
        city: json["city"],
        category: json["category"],
        garmentId: garmentId,
        garmentDetails: GarmentDetails.fromJson(json["garment_details"]),
        stitchingCategory: List<StitchingCategory>.from(
            json["stitching_category"]
                .map((x) => StitchingCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "category": category,
        "garmentId": garmentId,
        "garment_details": garmentDetails.toJson(),
        "stitching_category":
            List<dynamic>.from(stitchingCategory.map((x) => x.toJson())),
      };
}

class GarmentDetails {
  String garmentType;
  int alterationPrice;
  int stitchingBasePrice;
  double  totalPrice=0;
  String icon;
  String stitchingProcess;
  List<Design> design;
  int stitchType =0;// 0 for stitch 1 for alteration

  GarmentDetails({
    this.garmentType,
    this.alterationPrice,
    this.stitchingBasePrice,
    this.icon,
    this.stitchingProcess,
    this.design,
    this.totalPrice,
    this.stitchType
  });

  factory GarmentDetails.fromJson(Map<String, dynamic> json) => GarmentDetails(
        garmentType: json["garment_type"],
        alterationPrice: json["alteration_price"],
        stitchingBasePrice: json["stitching_base_price"],
        icon: json["icon"],
        stitchingProcess: json["stitching_process"],
        totalPrice: json["total_price"]?? 0,
        stitchType: json["stitchType"]?? 0,
        design:
            List<Design>.from(json["design"].map((x) => Design.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "garment_type": garmentType,
        "alteration_price": alterationPrice,
        "stitching_base_price": stitchingBasePrice,
        "icon": icon,
        "stitching_process": stitchingProcess,
        "total_price":totalPrice,
        "stitchType":stitchType,
        "design": List<dynamic>.from(design.map((x) => x.toJson())),
      };
}

class Design {
  List<String> generalDesign;
  List<String> frontDesign;
  List<String> backDesign;
  List<String> sideDesign;

  Design({
    this.generalDesign,
    this.frontDesign,
    this.backDesign,
    this.sideDesign,
  });

  factory Design.fromJson(Map<String, dynamic> json) => Design(
        generalDesign: List<String>.from(json["general_design"].map((x) => x)),
        frontDesign: List<String>.from(json["front_design"].map((x) => x)),
        backDesign: List<String>.from(json["back_design"].map((x) => x)),
        sideDesign: List<String>.from(json["side_design"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "general_design": List<dynamic>.from(generalDesign.map((x) => x)),
        "front_design": List<dynamic>.from(frontDesign.map((x) => x)),
        "back_design": List<dynamic>.from(backDesign.map((x) => x)),
        "side_design": List<dynamic>.from(sideDesign.map((x) => x)),
      };
}

class StitchingCategory {
  String category;
  List<CategoryDetail> categoryDetails;

  String selectedprice = "0";

  StitchingCategory(
      {this.category,
      this.categoryDetails,
      PaddleRangeSliderValueIndicatorShape});

  factory StitchingCategory.fromJson(Map<String, dynamic> json) =>
      StitchingCategory(
        category: json["category"],
        categoryDetails: List<CategoryDetail>.from(
            json["category_details"].map((x) => CategoryDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "category_details":
            List<dynamic>.from(categoryDetails.map((x) => x.toJson())),
      };
}

class CategoryDetail {
  String subcategory;
  int price;
  List<String> design;
  
  bool isSelected = false;

  CategoryDetail({
    this.subcategory,
    this.price,
    this.design,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
        subcategory: json["subcategory"],
        price: json["price"],
        design: List<String>.from(json["design"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "subcategory": subcategory,
        "price": price,
        "design": List<dynamic>.from(design.map((x) => x)),
      };
}
