library fashionconsulatnts_item_widget;

import 'package:masterji_user_app/model/fashionconsultants.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/views/fashionconsultants_details/fashionconsultants_details_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fashionconsulatnts_item_mobile.dart';
part 'fashionconsulatnts_item_tablet.dart';
part 'fashionconsulatnts_item_desktop.dart';

class FashionconsulatntsItemWidget extends StatelessWidget {
  final FashionConsultants consultantsItem;
  FashionconsulatntsItemWidget(this.consultantsItem);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _FashionconsulatntsItemMobile(consultants:consultantsItem,),
        desktop: _FashionconsulatntsItemDesktop(),
        tablet: _FashionconsulatntsItemTablet(),
    );
  }
}