// To parse this JSON data, do
//
//     final faq = faqFromJson(jsonString);

import 'dart:convert';

List<Faq> faqFromJson(String str) => List<Faq>.from(json.decode(str).map((x) => Faq.fromJson(x)));

String faqToJson(List<Faq> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faq {
    String createdAt;
    int no;
    String ques;
    String solution;
    bool isExpanded;

    Faq({
        this.createdAt,
        this.no,
        this.ques,
        this.solution,
        this.isExpanded:false
    });

    factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        createdAt: json["createdAt"],
        no: json["no"],
        ques: json["ques"],
        solution: json["solution"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "no": no,
        "ques": ques,
        "solution": solution,
    };
}
