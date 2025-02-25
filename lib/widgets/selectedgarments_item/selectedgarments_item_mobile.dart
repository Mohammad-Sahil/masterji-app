part of selectedgarments_item_widget;

class _SelectedgarmentsItemMobile extends StatefulWidget {
  final RfOrderItem selectedGarments;
  final Function(RfOrderItem) customClicked, deleteGarment;
  final Function(bool, int, int) switchValue;

  _SelectedgarmentsItemMobile(
      {Key key,
      this.selectedGarments,
      this.customClicked,
      this.deleteGarment,
      this.switchValue})
      : super(key: key);

  @override
  __SelectedgarmentsItemMobileState createState() =>
      __SelectedgarmentsItemMobileState();
}

class __SelectedgarmentsItemMobileState
    extends State<_SelectedgarmentsItemMobile> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: new Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                widget.selectedGarments.garmentDetails.icon,
                            height: 50,
                            width: 50,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              backgroundColor: Colors.grey,
                              strokeWidth: 1,
                            ),
                            errorWidget: (context, url, error) => Image.network(
                              "https://guide.auctria.com/assets/img/NoImageAvailable.6e2a4547.png",
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                      )),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.selectedGarments.garmentDetails.garmentType,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: ScreenUtil().setSp(48))),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: (isSwitched &&
                                        widget.selectedGarments
                                                .stitchingCategory.length !=
                                            0)
                                    ? () {
                                        widget.customClicked(
                                            widget.selectedGarments);
                                      }
                                    : null,
                                child: Text("Customize",
                                    style: TextStyle(
                                        color: ((!isSwitched ||
                                                widget
                                                        .selectedGarments
                                                        .stitchingCategory
                                                        .length ==
                                                    0))
                                            ? lightblue
                                            : darkblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: Container(
                                  color: Colors.black45,
                                  height: 15,
                                  width: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  widget.deleteGarment(widget.selectedGarments);
                                },
                                child: Text("Delete",
                                    style: TextStyle(
                                        color: darkblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text("Alter",
                            style: TextStyle(
                                color: isSwitched ? Colors.grey : Colors.black,
                                fontWeight: isSwitched ? null : FontWeight.w600,
                                fontSize: ScreenUtil().setSp(44))),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                              "₹" +
                                  (widget.selectedGarments.pricing.alterPrice
                                      .toString()
                                      .toString()),
                              style: TextStyle(
                                  color:
                                      isSwitched ? Colors.grey : Colors.black,
                                  fontWeight:
                                      isSwitched ? null : FontWeight.w600,
                                  fontSize: ScreenUtil().setSp(44))),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 36,
                        width: 60,
                        child: Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                            widget.switchValue(
                                value,
                                widget.selectedGarments.pricing.alterPrice,
                                widget.selectedGarments.pricing.stitchPrice);
                          },
                          activeTrackColor: lightblue,
                          activeColor: darkblue,
                          inactiveTrackColor: lightYellow,
                          inactiveThumbColor: appbarYellow,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Stitch",
                          style: TextStyle(
                              color: isSwitched ? Colors.black : Colors.grey,
                              fontWeight: isSwitched ? FontWeight.w600 : null,
                              fontSize: ScreenUtil().setSp(44))),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                            isSwitched
                                ? "₹" +
                                    widget.selectedGarments.pricing.totalPrice
                                        .toString()
                                : "₹" +
                                    widget.selectedGarments.pricing.stitchPrice
                                        .toString(),
                            style: TextStyle(
                                color: isSwitched ? Colors.black : Colors.grey,
                                fontWeight: isSwitched ? FontWeight.w600 : null,
                                fontSize: ScreenUtil().setSp(44))),
                      ),
                    ],
                  )
                ]),
            Divider(
              color: Colors.grey,
              thickness: 1,
            )
          ]),
        ));
  }
}
