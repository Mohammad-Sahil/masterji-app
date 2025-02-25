library profile_view;

import 'package:flutter_screenutil/screenutil.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/views/choose_location/choose_location_view.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'profile_view_model.dart';

part 'profile_mobile.dart';
part 'profile_tablet.dart';
part 'profile_desktop.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileViewModel viewModel = ProfileViewModel();
    return ViewModelProvider<ProfileViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) async{
     // await viewModel.getProfileData();
        // Do something once your viewModel is initialized
      await  viewModel.listenToUserDetails();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ProfileMobile(viewModel),
          desktop: _ProfileDesktop(viewModel),
          tablet: _ProfileTablet(viewModel),
        );
      }
    );
  }
}
