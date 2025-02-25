library aboutus_view;

import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'aboutus_view_model.dart';

part 'aboutus_mobile.dart';
part 'aboutus_tablet.dart';
part 'aboutus_desktop.dart';

class AboutusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AboutusViewModel viewModel = AboutusViewModel();
    return ViewModelProvider<AboutusViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) async{
        // Do something once your viewModel is initialized
       await viewModel.fetchAboutUs();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _AboutusMobile(viewModel),
          desktop: _AboutusDesktop(viewModel),
          tablet: _AboutusTablet(viewModel),
        );
      }
    );
  }
}
