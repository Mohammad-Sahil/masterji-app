library confirmvisit_view;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/utilities/custom_icon.dart';
import 'package:masterji_user_app/widgets/mj_button/mj_button_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'confirmvisit_view_model.dart';

part 'confirmvisit_mobile.dart';
part 'confirmvisit_tablet.dart';
part 'confirmvisit_desktop.dart';

class ConfirmvisitView extends StatelessWidget {
 final TotalGarments totalGarments;
  ConfirmvisitView(this.totalGarments);
  @override
  Widget build(BuildContext context) {
    ConfirmvisitViewModel viewModel = ConfirmvisitViewModel();
    return ViewModelProvider<ConfirmvisitViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
         viewModel.setOrder(totalGarments);
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ConfirmvisitMobile(viewModel),
          desktop: _ConfirmvisitDesktop(viewModel),
          tablet: _ConfirmvisitTablet(viewModel),  
        );
      }
    );
  }
}