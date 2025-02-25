library onboarding_screen_view;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/utilities/all_translations.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen_view_model.dart';

part 'onboarding_screen_mobile.dart';
part 'onboarding_screen_tablet.dart';
part 'onboarding_screen_desktop.dart';

class OnboardingScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OnboardingScreenViewModel viewModel = OnboardingScreenViewModel();
    return ViewModelProvider<OnboardingScreenViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _OnboardingScreenMobile(viewModel),
          desktop: _OnboardingScreenDesktop(viewModel),
          tablet: _OnboardingScreenTablet(viewModel),  
        );
      }
    );
  }
}