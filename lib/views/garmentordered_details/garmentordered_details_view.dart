library garmentordered_details_view;

import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/views/choose_location/choose_location_view.dart';
import 'package:masterji_user_app/views/home/home_view.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'garmentordered_details_view_model.dart';

part 'garmentordered_details_mobile.dart';
part 'garmentordered_details_tablet.dart';
part 'garmentordered_details_desktop.dart';

class GarmentorderedDetailsView extends StatelessWidget {
  final Map<String, dynamic> mapData;
  GarmentorderedDetailsView(this.mapData);

  @override
  Widget build(BuildContext context) {
    GarmentorderedDetailsViewModel viewModel = GarmentorderedDetailsViewModel();
    return ViewModelProvider<GarmentorderedDetailsViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          viewModel.setOrderId(mapData['orderId']);
          viewModel.getOrderDetails();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _GarmentorderedDetailsMobile(viewModel, mapData),
            desktop: _GarmentorderedDetailsDesktop(viewModel),
            tablet: _GarmentorderedDetailsTablet(viewModel),
          );
        });
  }
}
