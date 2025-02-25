part of catalog_widget;

class _CatalogMobile extends StatefulWidget {
  final Function(GarmentModel, bool) garmentSelected;
  final GarmentModel garments;
  final bool clearAll;
  _CatalogMobile({this.garments, @required this.garmentSelected,this.clearAll});

  @override
  __CatalogMobileState createState() => __CatalogMobileState();
}

class __CatalogMobileState extends State<_CatalogMobile>
    with AutomaticKeepAliveClientMixin<_CatalogMobile> {
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              changeColor = !changeColor;
            });
            widget.garmentSelected(widget.garments, changeColor);
          },
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0, right: 5),
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: 60,
                      height: 60,
                      color: changeColor ? appbarYellow : Colors.white,
                      // child: Image.network(garments.garmentDetails.icon),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: widget.garments.garmentDetails.icon,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            strokeWidth: 1,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  )),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {},
                child: Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: changeColor ? lightgreen : Colors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                            color: changeColor ? Colors.black : Colors.grey,
                            width: 1),
                      ),
                      child: Icon(
                        Icons.check,
                        color: changeColor ? Colors.black : Colors.grey,
                        size: 16,
                      ),
                    )),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            widget.garments.garmentDetails.garmentType,
            style: TextStyle(fontSize: 9),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
