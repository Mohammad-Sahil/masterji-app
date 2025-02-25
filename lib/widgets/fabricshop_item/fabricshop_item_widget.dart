library fabricshop_item_widget;


import 'package:masterji_user_app/model/fabricshops.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/views/fabricshops_detail/fabricshops_detail_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fabricshop_item_mobile.dart';
part 'fabricshop_item_tablet.dart';
part 'fabricshop_item_desktop.dart';

class FabricshopItemWidget extends StatelessWidget {
  final FabricShops shopItem;
  FabricshopItemWidget(this.shopItem);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _FabricshopItemMobile(shops: shopItem,),
        desktop: _FabricshopItemDesktop(),
        tablet: _FabricshopItemTablet(),
    );
  }
}