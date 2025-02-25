library orders_view;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masterji_user_app/widgets/order_item/order_item_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'orders_view_model.dart';

part 'orders_mobile.dart';
part 'orders_tablet.dart';
part 'orders_desktop.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrdersViewModel viewModel = OrdersViewModel();
    return ViewModelProvider<OrdersViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
       viewModel.getTotalOrders();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _OrdersMobile(viewModel),
          desktop: _OrdersDesktop(viewModel),
          tablet: _OrdersTablet(viewModel),  
        );
      }
    );
  }
}