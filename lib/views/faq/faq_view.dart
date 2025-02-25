library faq_view;

import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'faq_view_model.dart';

part 'faq_mobile.dart';
part 'faq_tablet.dart';
part 'faq_desktop.dart';

class FaqView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FaqViewModel viewModel = FaqViewModel();
    return ViewModelProvider<FaqViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) async{
        // Do something once your viewModel is initialized
        await viewModel.fetchFaq();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _FaqMobile(viewModel),
          desktop: _FaqDesktop(viewModel),
          tablet: _FaqTablet(viewModel),
        );
      }
    );
  }
}
