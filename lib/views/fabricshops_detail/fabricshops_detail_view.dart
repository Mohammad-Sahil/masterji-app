library fabricshops_detail_view;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/model/fabricshops.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'fabricshops_detail_view_model.dart';

part 'fabricshops_detail_mobile.dart';
part 'fabricshops_detail_tablet.dart';
part 'fabricshops_detail_desktop.dart';

class FabricshopsDetailView extends StatelessWidget {
  final FabricShops shops;
  FabricshopsDetailView(this.shops);

  @override
  Widget build(BuildContext context) {
    FabricshopsDetailViewModel viewModel = FabricshopsDetailViewModel();
    return ViewModelProvider<FabricshopsDetailViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _FabricshopsDetailMobile(viewModel,shops),
          desktop: _FabricshopsDetailDesktop(viewModel),
          tablet: _FabricshopsDetailTablet(viewModel),
        );
      }
    );
  }
}
