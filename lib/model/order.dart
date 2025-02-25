// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    String orderId;
    CustomerOrderPickUpDetails customerOrderPickUpDetails;
    List<OrderItem> orderItems;
    Pricing pricing;

    Order({
        this.orderId,
        this.customerOrderPickUpDetails,
        this.orderItems,
        this.pricing,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        customerOrderPickUpDetails: CustomerOrderPickUpDetails.fromJson(json["customer_order_pick_up_details"]),
        orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
        pricing: Pricing.fromJson(json["pricing"]),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "customer_order_pick_up_details": customerOrderPickUpDetails.toJson(),
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "pricing": pricing.toJson(),
    };
}

class CustomerOrderPickUpDetails {
    String pickupDate;
    String pickupExecutiveId;
    String pickupExecutiveName;
    String pickupExecutiveContact;
    String pickupAddress;

    CustomerOrderPickUpDetails({
        this.pickupDate,
        this.pickupExecutiveId,
        this.pickupExecutiveName,
        this.pickupExecutiveContact,
        this.pickupAddress,
    });

    factory CustomerOrderPickUpDetails.fromJson(Map<String, dynamic> json) => CustomerOrderPickUpDetails(
        pickupDate: json["pickup_date"],
        pickupExecutiveId: json["pickup_executive_id"],
        pickupExecutiveName: json["pickup_executive_name"],
        pickupExecutiveContact: json["pickup_executive_contact"],
        pickupAddress: json["pickup_address"],
    );

    Map<String, dynamic> toJson() => {
        "pickup_date": pickupDate,
        "pickup_executive_id": pickupExecutiveId,
        "pickup_executive_name": pickupExecutiveName,
        "pickup_executive_contact": pickupExecutiveContact,
        "pickup_address": pickupAddress,
    };
}

class OrderItem {
    String category;
    String garmentType;
    String garmentId;
    int workType;
    List<Customisation> customisation;
    Details tailorDetails;
    String status;
    Details deliveryDetails;
    int basePrice;
    double totalPrice;

    OrderItem({
        this.category,
        this.garmentType,
        this.garmentId,
        this.workType,
        this.customisation,
        this.tailorDetails,
        this.status,
        this.deliveryDetails,
        this.basePrice,
        this.totalPrice,
    });

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        category: json["category"] == null ? null : json["category"],
        garmentType: json["garment_type"] == null ? null : json["garment_type"],
        garmentId: json["garment_id"] == null ? null : json["garment_id"],
        workType: json["work_type"] == null ? null : json["work_type"],
        customisation: json["customisation"] == null ? null : List<Customisation>.from(json["customisation"].map((x) => Customisation.fromJson(x))),
        tailorDetails: json["tailor_details"] == null ? null : Details.fromJson(json["tailor_details"]),
        status: json["status"] == null ? null : json["status"],
        deliveryDetails: json["delivery_details"] == null ? null : Details.fromJson(json["delivery_details"]),
        basePrice: json["base_price"] == null ? null : json["base_price"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
    );

    Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "garment_type": garmentType == null ? null : garmentType,
        "garment_id": garmentId == null ? null : garmentId,
        "work_type": workType == null ? null : workType,
        "customisation": customisation == null ? null : List<dynamic>.from(customisation.map((x) => x.toJson())),
        "tailor_details": tailorDetails == null ? null : tailorDetails.toJson(),
        "status": status == null ? null : status,
        "delivery_details": deliveryDetails == null ? null : deliveryDetails.toJson(),
        "base_price": basePrice == null ? null : basePrice,
        "total_price": totalPrice == null ? null : totalPrice,
    };
}

class Customisation {
    String type;
    int price;
    String category;

    Customisation({
        this.type,
        this.price,
        this.category
    });

    factory Customisation.fromJson(Map<String, dynamic> json) => Customisation(
        type: json["type"],
        category: json["category"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
        "category":category
    };
}

class Details {
    Details();

    factory Details.fromJson(Map<String, dynamic> json) => Details(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Pricing {
    String total;
    String paymentMode;
    String paymentId;
    String advance;
    String discount;

    Pricing({
        this.total,
        this.paymentMode,
        this.paymentId,
        this.advance,
        this.discount,
    });

    factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        total: json["total"],
        paymentMode: json["payment_mode"],
        paymentId: json["payment_id"],
        advance: json["advance"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "payment_mode": paymentMode,
        "payment_id": paymentId,
        "advance": advance,
        "discount": discount,
    };
}
