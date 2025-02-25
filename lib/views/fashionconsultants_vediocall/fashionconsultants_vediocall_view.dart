library fashionconsultants_vediocall_view;


import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:masterji_user_app/model/fashionconsultants.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'fashionconsultants_vediocall_view_model.dart';

part 'fashionconsultants_vediocall_mobile.dart';
part 'fashionconsultants_vediocall_tablet.dart';
part 'fashionconsultants_vediocall_desktop.dart';

class FashionconsultantsVediocallView extends StatelessWidget {
  final FashionConsultants fashionConsultants;
   FashionconsultantsVediocallView(this.fashionConsultants);
  @override
  Widget build(BuildContext context) {
    FashionconsultantsVediocallViewModel viewModel = FashionconsultantsVediocallViewModel();
    return ViewModelProvider<FashionconsultantsVediocallViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _FashionconsultantsVediocallMobile(viewModel,fashionConsultants),
          desktop: _FashionconsultantsVediocallDesktop(viewModel),
          tablet: _FashionconsultantsVediocallTablet(viewModel),  
        );
      }
    );
  }
}