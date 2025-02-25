library home_view;

import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/utilities/custom_icon.dart';
import 'package:masterji_user_app/views/aboutus/aboutus_view.dart';
import 'package:masterji_user_app/views/fabricshops/fabricshops_view.dart';
import 'package:masterji_user_app/views/faq/faq_view.dart';
import 'package:masterji_user_app/views/fashionconsultants/fashionconsultants_view.dart';
import 'package:masterji_user_app/views/homepage/homepage_view.dart';
import 'package:masterji_user_app/views/orders/orders_view.dart';
import 'package:masterji_user_app/views/profile/profile_view.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
       
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _HomeMobile(viewModel),
          desktop: _HomeDesktop(viewModel),
          tablet: _HomeTablet(viewModel),  
        );
      }
    );
  }
}