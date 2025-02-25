library auth_phone_view;

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/utilities/custom_icon.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'auth_phone_view_model.dart';

part 'auth_phone_mobile.dart';
part 'auth_phone_tablet.dart';
part 'auth_phone_desktop.dart';

class AuthPhoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthPhoneViewModel viewModel = AuthPhoneViewModel();
    return ViewModelProvider<AuthPhoneViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _AuthPhoneMobile(viewModel),
          desktop: _AuthPhoneDesktop(viewModel),
          tablet: _AuthPhoneTablet(viewModel),  
        );
      }
    );
  }
}