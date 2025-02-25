import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:masterji_user_app/core/base/base_service.dart';
import 'package:masterji_user_app/core/logger.dart';
import 'package:masterji_user_app/model/aboutus.dart';
import 'package:masterji_user_app/model/fabricshops.dart';
import 'package:masterji_user_app/model/faq.dart';
import 'package:masterji_user_app/model/fashionconsultants.dart';
import 'package:masterji_user_app/model/totalgarments.dart';

class FirestoreService extends BaseService {
  var logger = getLogger("FirestoreService");

  Future getFabricShops(var cityName) async {
    Query _shopsCollectionReference =
        Firestore.instance.collection('fabricShops');

    var cityname = cityName;

    try {
      var shopDocuments = await _shopsCollectionReference
          .where('city', isEqualTo: cityname)
          .getDocuments();
      if (shopDocuments.documents.isNotEmpty) {
        return shopDocuments.documents
            .map((snapshot) => FabricShops.fromJson(snapshot.data))
            .toList();
      } else {
        logger.i("Bengaluru query");
        var bangloreShop = await _shopsCollectionReference
            .where('city', isEqualTo: 'bengaluru')
            .getDocuments();
        return bangloreShop.documents
            .map((snapshot) => FabricShops.fromJson(snapshot.data))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getFaq() async {
    final Query _faqsCollectionReference =
        Firestore.instance.collection('faqs').orderBy('no');

    try {
      var faqDocuments = await _faqsCollectionReference.getDocuments();
      if (faqDocuments.documents.isNotEmpty) {
        return faqDocuments.documents
            .map((snapshot) => Faq.fromJson(snapshot.data))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getAboutUs() async {
    final Query _aboutusCollectionReference =
        Firestore.instance.collection('aboutus').orderBy('serialNo');

    try {
      var aboutusDocuments = await _aboutusCollectionReference.getDocuments();
      if (aboutusDocuments.documents.isNotEmpty) {
        return aboutusDocuments.documents
            .map((snapshot) => AboutUs.fromJson(snapshot.data))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getFashionConsultants() async {
    final CollectionReference _fashionCollectionReference =
        Firestore.instance.collection('fashionConsultant');

    try {
      var fashionDocuments = await _fashionCollectionReference.getDocuments();
      if (fashionDocuments.documents.isNotEmpty) {
        return fashionDocuments.documents
            .map((snapshot) =>
                FashionConsultants.fromJson(snapshot.data, snapshot.documentID))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future saveOrders(TotalGarments data) async {
    final CollectionReference _orderedDetail =
        Firestore.instance.collection('Orders');
    _orderedDetail.document(data.orderId).setData(data.toJson());
  }
}
