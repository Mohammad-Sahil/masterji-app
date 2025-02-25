import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masterji_user_app/core/base/base_service.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/utilities/route.dart';

class BookingService extends BaseService {
  final CollectionReference _fashionConsultantBooking =
      Firestore.instance.collection('fashionConsultantBooking');

  final NavigatorService _navigatorService = locator<NavigatorService>();

  final UserService _userService = locator<UserService>();
  fashionConsultantBooking(
      {String consultantId,
      consultantName,
      bookingDate,
      bookingTime,
      paymentId,
      expertise,
      consultantImage,
      int amount}) async {
    var userId = await _userService.getPhoneNumber();
    var bookingId = new DateTime.now().millisecondsSinceEpoch.toString();
    var orderDate = new DateTime.now().toIso8601String();
    Map<String, dynamic> booking = Map();
    booking = {
      'bookingId': bookingId,
      'userId': userId,
      'consultantId': consultantId,
      'consultantName': consultantName,
      'bookingDate': bookingDate,
      'bookingTime': bookingTime,
      'amount': amount,
      'paymentId': paymentId,
      'orderDate': orderDate,
      'expertise': expertise,
      'consultantImage': consultantImage
    };

    await _fashionConsultantBooking.document(bookingId).setData(booking);
    await _navigatorService.navigateWithPageReplacement(
        FashionConsultantBookingConfirm,
        arguments: booking);
  }
}
