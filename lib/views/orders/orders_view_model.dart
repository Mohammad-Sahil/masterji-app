import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/order_service.dart';

class OrdersViewModel extends BaseViewModel {
  OrdersViewModel();

  OrderService _orderService = locator<OrderService>();
  List orderlist = new List();

  getTotalOrders() async {
    busy = true;
    orderlist = await _orderService.getTotalUserOrder();
   
    busy = false;
  }
  // Add ViewModel specific code here
}
