library homepage_view;

import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/model/garment.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/widgets/catalog/catalog_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'homepage_view_model.dart';
part 'homepage_mobile.dart';
part 'homepage_tablet.dart';
part 'homepage_desktop.dart';

class HomepageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomepageViewModel viewModel = HomepageViewModel();
    return ViewModelProvider<HomepageViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) async {
          await viewModel.getLadiesCatalog();
          await viewModel.getGentsCatalog();
          await viewModel.saveFCMToken();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _HomepageMobile(viewModel),
            desktop: _HomepageDesktop(viewModel),
            tablet: _HomepageTablet(viewModel),
          );
        });
  }
}
