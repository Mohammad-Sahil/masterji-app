library fashionconsultants_details_view;

import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/model/fashionconsultants.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'fashionconsultants_details_view_model.dart';

part 'fashionconsultants_details_mobile.dart';
part 'fashionconsultants_details_tablet.dart';
part 'fashionconsultants_details_desktop.dart';

class FashionconsultantsDetailsView extends StatelessWidget {
   final FashionConsultants consultants;
  FashionconsultantsDetailsView(this.consultants);
  @override
  Widget build(BuildContext context) {
    FashionconsultantsDetailsViewModel viewModel = FashionconsultantsDetailsViewModel();
    return ViewModelProvider<FashionconsultantsDetailsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _FashionconsultantsDetailsMobile(viewModel,consultants),
          desktop: _FashionconsultantsDetailsDesktop(viewModel),
          tablet: _FashionconsultantsDetailsTablet(viewModel),
        );
      }
    );
  }
}
