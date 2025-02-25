import 'dart:math';

import 'package:dio/dio.dart';
import 'package:masterji_user_app/core/base/base_service.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/firestore.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/utilities/constant.dart';
import 'package:masterji_user_app/utilities/route.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class OrderPayment extends BaseService {
  Razorpay _razorpay;
  final UserService _userService = locator<UserService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();
  TotalGarments totalGarments;
  Random _rnd = Random();
  Future makeOrderPayment(TotalGarments _totalGarments) async {
    totalGarments = _totalGarments;
    var orderId = new DateTime.now().millisecondsSinceEpoch;
    var phoneNumber = await _userService.getPhoneNumber();
    print(orderId);
    Dio dio = new Dio();
    Map data = {"amount": 50 * 100};
    Response response = await dio.post(url, data: data);
    var options = {
      "order_id": response.data['id'],
      'key': RAZOR_PAY_KEY,
      'payment_capture': true,
      'amount': 50 * 100,
      'name': 'MasterJI',
      'description': 'Garment Order Place',
      'prefill': {
        'contact': phoneNumber,
      },
      'external': {
        'wallets': ["amazonpay"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("faielddd");
    }
  }

  OrderPayment() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    totalGarments.prePaymentId = response.paymentId;
    
    await _firestoreService.saveOrders(totalGarments);
    var map = {
      "orderId": totalGarments.orderId,
      "bookingDate": totalGarments.bookingDate
    };
    await _navigatorService.goBack();
    await _navigatorService.navigateWithPageReplacement(GarmentsOrdered,
        arguments: map);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    var notificationBody = {"title": "", "msg": response.message};
    _navigatorService.navigateTo(ErrorNotification,
        arguments: notificationBody);
  }

  void _handleExternalWallet(ExternalWalletResponse response) async {}

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
