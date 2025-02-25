library splash_view;

import 'package:masterji_user_app/utilities/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'splash_view_model.dart';

part 'splash_mobile.dart';
part 'splash_tablet.dart';
part 'splash_desktop.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashViewModel viewModel = SplashViewModel();
    return ViewModelProvider<SplashViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) async {
          await new Future.delayed(const Duration(seconds: 3));
          await viewModel.handleStartUpLogic();
          await viewModel.isLoggedIn();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _SplashMobile(viewModel),
            desktop: _SplashDesktop(viewModel),
            tablet: _SplashTablet(viewModel),
          );
        });
  }
}
