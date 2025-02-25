library order_customize_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/model/garment.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'order_customize_view_model.dart';

part 'order_customize_mobile.dart';
part 'order_customize_tablet.dart';
part 'order_customize_desktop.dart';

class OrderCustomizeView extends StatelessWidget {
  final GarmentModel model;
  final double totalPrice;
  int index,previous_price;
  OrderCustomizeView(this.model,this.totalPrice,this.index,this.previous_price);

  @override
  Widget build(BuildContext context) {
    OrderCustomizeViewModel viewModel = OrderCustomizeViewModel();
    return ViewModelProvider<OrderCustomizeViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
       viewModel.setGarmentModel(model,totalPrice,index,previous_price);
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _OrderCustomizeMobile(viewModel,this.totalPrice),
          desktop: _OrderCustomizeDesktop(viewModel),
          tablet: _OrderCustomizeTablet(viewModel),  
        );
      }
    );
  }
}