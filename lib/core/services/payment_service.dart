import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:masterji_user_app/core/base/base_service.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/booking_service.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/utilities/constant.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class PaymentService extends BaseService {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  var bookingData = {
    'consultantId': '',
    'consultantName': '',
    'bookingDate': '',
    'bookingTime': '',
    'amount': 0
  };
  Random _rnd = Random();
  Razorpay _razorpay;
  PaymentService() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  final UserService _userService = locator<UserService>();

  final BookingService _bookingService = locator<BookingService>();

  Future openCheckout(
      {int amount,
      String consultantId,
      consultantName,
      bookingDate,
      expertise,
      consultantImage,
      bookingTime}) async {
    bookingData = {
      'consultantId': consultantId,
      'consultantName': consultantName,
      'bookingDate': bookingDate,
      'bookingTime': bookingTime,
      'amount': amount,
      'expertise': expertise,
      'consultantImage': consultantImage
    };
    var orderId = new DateTime.now().millisecondsSinceEpoch;
    var phoneNumber = await _userService.getPhoneNumber();
    print(orderId);
    Dio dio = new Dio();
    Map data = {"amount": amount * 100};
    Response response = await dio.post(url, data: data);
    print("got orderid" + response.data['id']);
    var options = {
      "order_id": response.data['id'],
      'key': RAZOR_PAY_KEY,
      'payment_capture': true,
      'amount': amount * 100,
      'name': 'MasterJI',
      'description': 'Fashion Consultant Booking',
      'prefill': {
        'contact': phoneNumber,
      },
      'external': {'wallets': []}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("SUCCESS: " + response.paymentId);
    await _bookingService.fashionConsultantBooking(
        paymentId: response.paymentId,
        amount: bookingData['amount'],
        bookingDate: bookingData['bookingDate'],
        bookingTime: bookingData['bookingTime'],
        consultantId: bookingData['consultantId'],
        expertise: bookingData['expertise'],
        consultantImage: bookingData['consultantImage'],
        consultantName: bookingData['consultantName']);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(
      "EXTERNAL_WALLET: " + response.walletName,
    );
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
