library choose_language_view;

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'choose_language_view_model.dart';

part 'choose_language_mobile.dart';
part 'choose_language_tablet.dart';
part 'choose_language_desktop.dart';

class ChooseLanguageView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    ChooseLanguageViewModel viewModel = ChooseLanguageViewModel();
    return ViewModelProvider<ChooseLanguageViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) async {
          // Do something once your viewModel is initialized
          FirebaseAuth auth = FirebaseAuth.instance;
          var user = await auth.currentUser();
          if (user != null) {
            await viewModel.navigateToHome();
          }
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _ChooseLanguageMobile(ChooseLanguageViewModel()),
            desktop: _ChooseLanguageDesktop(viewModel),
            tablet: _ChooseLanguageTablet(viewModel),
          );
        });
  }
}
