library selectedgarments_item_widget;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'selectedgarments_item_mobile.dart';
part 'selectedgarments_item_tablet.dart';
part 'selectedgarments_item_desktop.dart';

class SelectedgarmentsItemWidget extends StatelessWidget {
  final RfOrderItem selectedGarment;
  final Function(RfOrderItem) customClicked, deleteGarment;
  final Function(bool,int,int) switchValue;
  SelectedgarmentsItemWidget({
    this.selectedGarment,
    this.customClicked,
    this.deleteGarment,
    this.switchValue,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _SelectedgarmentsItemMobile(
        selectedGarments: selectedGarment,
        customClicked: customClicked,
        deleteGarment: deleteGarment,
        switchValue: switchValue,
      ),
      desktop: _SelectedgarmentsItemDesktop(),
      tablet: _SelectedgarmentsItemTablet(),
    );
  }
}
