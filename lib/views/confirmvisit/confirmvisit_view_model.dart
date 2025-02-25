import 'package:intl/intl.dart';
import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/firestore.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/core/services/orderpayment.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/utilities/route.dart';

class ConfirmvisitViewModel extends BaseViewModel {
  var formatter = new DateFormat('yyyy-MM-dd');
  ConfirmvisitViewModel();
  TotalGarments totalGarments;
  NavigatorService _navigatorService = locator<NavigatorService>();
  UserService _userService = locator<UserService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  OrderPayment orderPayment = locator<OrderPayment>();

  void setOrder(TotalGarments _totalGarments) {
    totalGarments = _totalGarments;
  }

  void setDate(String date) {
    totalGarments.bookingDate = date;
  }

  void setTime(String time) {
    totalGarments.bookingTime = time;
  }

  Future confirm() async {
    var now = new DateTime.now();
    DateTime date = DateTime.parse(totalGarments.bookingDate);
    String selectedDate = formatter.format(date);
    String currentDate = formatter.format(now);

    var phone = await _userService.getPhoneNumber();
    var customerData = await _userService.getProfileData();

    totalGarments.phoneNumber = phone;
    totalGarments.address = Address.fromJson(customerData['address']);
    var orderId = new DateTime.now().millisecondsSinceEpoch.toString();
    totalGarments.orderId = orderId;
    totalGarments.currentStatus = "PLACED";
    totalGarments.orderDate = currentDate;
    if (selectedDate == currentDate) {
      try {
        await orderPayment.makeOrderPayment(totalGarments);
      } catch (e) {
        print("error payment");
      }
    } else {
      await _firestoreService.saveOrders(totalGarments);
      Map<String, dynamic> map = {
        "orderId": orderId,
        "bookingDate": totalGarments.bookingDate
      };
      await _navigatorService.navigateWithPageReplacement(GarmentsOrdered,
          arguments: map);
    }
  }
}
