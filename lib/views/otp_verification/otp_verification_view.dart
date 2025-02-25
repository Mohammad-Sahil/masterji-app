library otp_verification_view;

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/utilities/custom_icon.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'otp_verification_view_model.dart';

part 'otp_verification_mobile.dart';
part 'otp_verification_tablet.dart';
part 'otp_verification_desktop.dart';

class OtpVerificationView extends StatelessWidget {
  final String phone;
  OtpVerificationView(this.phone);

  @override
  Widget build(BuildContext context) {
    OtpVerificationViewModel viewModel = OtpVerificationViewModel();
    return ViewModelProvider<OtpVerificationViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _OtpVerificationMobile(viewModel, phone),
            desktop: _OtpVerificationDesktop(viewModel),
            tablet: _OtpVerificationTablet(viewModel),
          );
        });
  }
}
