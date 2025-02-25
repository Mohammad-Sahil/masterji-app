library order_item_widget;

import 'package:intl/intl.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/utilities/custom_icon.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'order_item_mobile.dart';
part 'order_item_tablet.dart';
part 'order_item_desktop.dart';

class OrderItemWidget extends StatelessWidget {
  final orderListItem;
  OrderItemWidget(this.orderListItem);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _OrderItemMobile(orderListItem),
        desktop: _OrderItemDesktop(),
        tablet: _OrderItemTablet(),
    );
  }
}