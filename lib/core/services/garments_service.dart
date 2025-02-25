import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:masterji_user_app/core/base/base_service.dart';
import 'package:masterji_user_app/model/garment.dart';

class GarmentService extends BaseService {
  getGarments(String category, var cityName) async {
    Query _garmentCollectionReferenece = Firestore.instance
        .collection('garments')
        .where('category', isEqualTo: category);
    var cityname = cityName;
    List<GarmentModel> garment = new List();

    try {
      var shopDocuments = await _garmentCollectionReferenece
          .where('city', isEqualTo: cityname)
          .getDocuments();
      if (shopDocuments.documents.isNotEmpty) {
        return shopDocuments.documents
            .map((snapshot) =>
                GarmentModel.fromJson(snapshot.data, snapshot.documentID,true))
            .toList();
      } else {
        //return garment;
        log.i("Bengaluru query");
        var bangloreShop = await _garmentCollectionReferenece
            .where('city', isEqualTo: 'bengaluru')
            .getDocuments();
        return bangloreShop.documents
            .map((snapshot) => GarmentModel.fromJson(snapshot.data,snapshot.documentID,false))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  getStitchingProcess(String garmentId) async{
    CollectionReference reference = Firestore.instance.collection("garments");
    
    try {
       var response= await reference.document(garmentId).get();
       return response['garment_details']['stitching_process'];
    } catch (e) {
      return e.toString();
    }
    
  }
}
