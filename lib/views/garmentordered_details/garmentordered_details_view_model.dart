import 'package:intl/intl.dart';
import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/core/services/order_service.dart';
import 'package:masterji_user_app/core/services/toaster.dart';
import 'package:masterji_user_app/utilities/route.dart';

class GarmentorderedDetailsViewModel extends BaseViewModel {
  GarmentorderedDetailsViewModel();
  final _orderService = locator<OrderService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();
  String _orderId;
  String bookingDate, bookingTime, bookingAddress, orderTime = "";
  String garmentname = "";
  var orderDetails;
  setOrderId(String orderId) async {
    _orderId = orderId;
  }

  getOrderDetails() async {
    busy = true;
    var _orderDetails = await _orderService.getOrderDetails(_orderId);
    if (_orderDetails is String) {
      print(_orderDetails);
    } else {
      orderDetails = _orderDetails.data;
      print(orderDetails);
      var formatter = new DateFormat('EEEE, MMM d');
      DateTime date = DateTime.parse(orderDetails['bookingDate']);
      bookingDate = formatter.format(date);
      bookingTime = orderDetails['bookingTime'];
      bookingAddress = orderDetails['address']['address'];
      orderTime = readTimestamp(int.parse(orderDetails['orderID']));

      var garment = orderDetails['RfOrderItem'];

      print(garment);

      for (var item in garment) {
        print(item["garment_details"]["garment_type"]);
        if (garmentname == "") {
          garmentname = item["garment_details"]["garment_type"];
        } else {
          garmentname =
              garmentname + "" + ", " + item["garment_details"]["garment_type"];
        }
      }
    }
    busy = false;
  }

  String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('dd MMM, yyyy HH:mm a');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }

    return time;
  }

  updateAddress(_address) async {
    busy = true;
    print(_address);
    bookingAddress = _address['address'] ?? bookingAddress;
    await _orderService.orderAddress(_address, _orderId);
    busy = false;
  }

  void showSuccess() {
    if (_orderId != null) {
      _navigatorService.navigateTo(SuccessNotification, arguments: {
        "title": "Order Placed",
        "msg": "Your order has been placed succesfully"
      });
    }
  }
}
