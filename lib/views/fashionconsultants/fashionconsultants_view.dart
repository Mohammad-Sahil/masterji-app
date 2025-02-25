library fashionconsultants_view;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/widgets/fashionconsulatnts_item/fashionconsulatnts_item_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'fashionconsultants_view_model.dart';

part 'fashionconsultants_mobile.dart';
part 'fashionconsultants_tablet.dart';
part 'fashionconsultants_desktop.dart';

class FashionconsultantsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FashionconsultantsViewModel viewModel = FashionconsultantsViewModel();
    return ViewModelProvider<FashionconsultantsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
        viewModel.fetchConsultants();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: FashionconsultantsMobile(viewModel),
          desktop: _FashionconsultantsDesktop(viewModel),
          tablet: _FashionconsultantsTablet(viewModel),
        );
      }
    );
  }
}
