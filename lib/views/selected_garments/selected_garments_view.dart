library selected_garments_view;

import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/utilities/constant.dart';
import 'package:masterji_user_app/views/choose_location/choose_location_view.dart';
import 'package:masterji_user_app/views/home/home_view.dart';
import 'package:masterji_user_app/views/selected_garments/customisation.dart';
import 'package:masterji_user_app/widgets/mj_button/mj_button_widget.dart';
import 'package:masterji_user_app/widgets/selectedgarments_item/selectedgarments_item_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'selected_garments_view_model.dart';

part 'selected_garments_mobile.dart';
part 'selected_garments_tablet.dart';
part 'selected_garments_desktop.dart';

class SelectedGarmentsView extends StatelessWidget {
  final List<RfOrderItem> selectedGarments;
  SelectedGarmentsView(this.selectedGarments);

  @override
  Widget build(BuildContext context) {
    SelectedGarmentsViewModel viewModel = SelectedGarmentsViewModel();
    return ViewModelProvider<SelectedGarmentsViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) async {
          // Do something once your viewModel is initialized
          viewModel.addSeletedGarment(selectedGarments);
          await viewModel.getProfileData();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _SelectedGarmentsMobile(viewModel),
            desktop: _SelectedGarmentsDesktop(viewModel),
            tablet: _SelectedGarmentsTablet(viewModel),
          );
        });
  }
}
