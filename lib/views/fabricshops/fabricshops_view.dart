library fabricshops_view;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/widgets/fabricshop_item/fabricshop_item_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'fabricshops_view_model.dart';

part 'fabricshops_mobile.dart';
part 'fabricshops_tablet.dart';
part 'fabricshops_desktop.dart';

class FabricshopsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FabricshopsViewModel viewModel = FabricshopsViewModel();
    return ViewModelProvider<FabricshopsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {

         viewModel.fetchPosts();

        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: FabricshopsMobile(viewModel),
          desktop: _FabricshopsDesktop(viewModel),
          tablet: _FabricshopsTablet(viewModel),
        );
      }
    );
  }
}
