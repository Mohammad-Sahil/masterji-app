library mj_button_widget;

import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'mj_button_mobile.dart';
part 'mj_button_tablet.dart';
part 'mj_button_desktop.dart';

class MjButtonWidget extends StatelessWidget {
  final String buttonText;
  final double padding;
  MjButtonWidget({this.buttonText, this.padding});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _MjButtonMobile(
        buttonText: buttonText,
        padding: padding,
      ),
      desktop: _MjButtonDesktop(),
      tablet: _MjButtonTablet(),
    );
  }
}
