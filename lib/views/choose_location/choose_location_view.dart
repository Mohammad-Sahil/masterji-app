library choose_location_view;

import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map_picker/flutter_map_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/utilities/constant.dart';
import 'package:masterji_user_app/widgets/mj_button/mj_button_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'choose_location_view_model.dart';

part 'choose_location_mobile.dart';
part 'choose_location_tablet.dart';
part 'choose_location_desktop.dart';

class ChooseLocationView extends StatelessWidget {
  final int dateFlag;
  ChooseLocationView(this.dateFlag);
  @override
  Widget build(BuildContext context) {
    ChooseLocationViewModel viewModel = ChooseLocationViewModel();
    return ViewModelProvider<ChooseLocationViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _ChooseLocationMobile(viewModel, dateFlag),
            desktop: _ChooseLocationDesktop(viewModel),
            tablet: _ChooseLocationTablet(viewModel),
          );
        });
  }
}
