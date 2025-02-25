library catalog_widget;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:masterji_user_app/model/garment.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'catalog_mobile.dart';
part 'catalog_tablet.dart';
part 'catalog_desktop.dart';

class CatalogWidget extends StatefulWidget {
  final GarmentModel garments;
  final bool clearAll;
  final Function(GarmentModel, bool) garmentSelected;
  CatalogWidget({this.garments, @required this.garmentSelected, this.clearAll});

  @override
  _CatalogWidgetState createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _CatalogMobile(
          garments: widget.garments,
          garmentSelected: widget.garmentSelected,
          clearAll: widget.clearAll),
      desktop: _CatalogDesktop(),
      tablet: _CatalogTablet(),
    );
  }
}
