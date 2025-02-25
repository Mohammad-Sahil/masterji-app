library fashion_consultant_booking_success_view;

import 'package:intl/intl.dart';
import 'package:masterji_user_app/widgets/mj_button/mj_button_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'fashion_consultant_booking_success_view_model.dart';

part 'fashion_consultant_booking_success_mobile.dart';
part 'fashion_consultant_booking_success_tablet.dart';
part 'fashion_consultant_booking_success_desktop.dart';

class FashionConsultantBookingSuccessView extends StatelessWidget {
  final Map bookingDetails;
  FashionConsultantBookingSuccessView(this.bookingDetails);

  @override
  Widget build(BuildContext context) {
    FashionConsultantBookingSuccessViewModel viewModel =
        FashionConsultantBookingSuccessViewModel();
    return ViewModelProvider<
            FashionConsultantBookingSuccessViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _FashionConsultantBookingSuccessMobile(viewModel,bookingDetails),
            desktop: _FashionConsultantBookingSuccessDesktop(viewModel),
            tablet: _FashionConsultantBookingSuccessTablet(viewModel),
          );
        });
  }
}
