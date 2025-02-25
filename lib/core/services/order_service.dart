import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:masterji_user_app/core/base/base_service.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/user_service.dart';

class OrderService extends BaseService {

  UserService _userService=locator<UserService>();
  final CollectionReference _orderedDetail =
      Firestore.instance.collection('Orders');

  Future getOrderDetails(String orderId) async {
    try {
      var orderDetails = await _orderedDetail.document(orderId).get();

      return orderDetails;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future orderAddress(Map address, String orderId) async {
    await _orderedDetail.document(orderId).updateData({"address": address});
  }

 Future getTotalUserOrder() async{
   var phoneNum= await _userService.getPhoneNumber();
   var orders = await _orderedDetail
          .where('phoneNumber', isEqualTo: phoneNum).orderBy("orderID",descending: true)
          .getDocuments();
     
      return orders.documents;
 }

}
