import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:masterji_user_app/core/base/base_service.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class UserService extends BaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      Firestore.instance.collection('customers');

  final NavigatorService _navigatorService = locator<NavigatorService>();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  Future saveAddress({Map userLocation, int dateFlag}) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    Map<String, dynamic> userDetails = Map();
    userDetails['contact'] = user.phoneNumber;
    userDetails['address'] = userLocation;
    if (dateFlag == 0) {
      userDetails['registerAt'] = new DateTime.now().toIso8601String();
    }
    await _userCollection
        .document(user.phoneNumber)
        .setData(userDetails, merge: true);

    if (dateFlag == 1) {
      await _navigatorService.goBack();
      await _navigatorService.goBack();
    } else {}
  }

  Future getPhoneNumber() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.phoneNumber;
  }

  Future saveName({String userName}) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    Map<String, dynamic> userMap = Map();
    userMap['name'] = userName;

    try {
      await _userCollection
          .document(user.phoneNumber)
          .setData(userMap, merge: true);
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getProfileData() async {
    var phoneNumber = await getPhoneNumber();
    final CollectionReference _profileData =
        Firestore.instance.collection('customers');
    var customerdetail;
    try {
      customerdetail = await _profileData.document(phoneNumber).get();
      print(customerdetail.data);
    } catch (e) {}
    return customerdetail.data;
  }

  final StreamController<Map> _userDetailsController =
      StreamController<Map>.broadcast();

  final CollectionReference _customerCollectionReference =
      Firestore.instance.collection('customers');

  Stream listenToUserDetails(String userId) {
    _customerCollectionReference
        .document(userId)
        .snapshots()
        .listen((userDetail) {
      var posts = userDetail.data;
      _userDetailsController.add(posts);
    });
    return _userDetailsController.stream;
  }

  saveFCMToken() async {
    var token = await firebaseMessaging.getToken();
    FirebaseUser user = await _firebaseAuth.currentUser();
    Map<String, dynamic> userMap = Map();
    userMap['fcm_token'] = token;

    try {
      await _userCollection
          .document(user.phoneNumber)
          .setData(userMap, merge: true);
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
