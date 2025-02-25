// To parse this JSON data, do
//
//     final aboutUs = aboutUsFromJson(jsonString);

import 'dart:convert';

List<AboutUs> aboutUsFromJson(String str) => List<AboutUs>.from(json.decode(str).map((x) => AboutUs.fromJson(x)));

String aboutUsToJson(List<AboutUs> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutUs {
    String content;
    String heading;
    int serialNumber;

    AboutUs({
        this.content,
        this.heading,
        this.serialNumber,
    });

    factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
        content: json["content"],
        heading: json["heading"],
        serialNumber: json["serialNo"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "heading": heading,
        "serialNo": serialNumber,
    };
}
