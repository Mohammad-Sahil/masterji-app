part of order_item_widget;

class _OrderItemMobile extends StatelessWidget {
  final orderListItem;
  _OrderItemMobile(this.orderListItem);
  var garmentsname = "";
  var bookingDate;
  var workType;
  var totalPrice = 0;
  GlobalKey _toolTipKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    getPrice();
    getdata();
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 4, right: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Text(
                    garmentsname != null ? garmentsname : "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(MyFlutterApp.stitch, color: appbarYellow),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                        child: Text(workType),
                      ),
                      InkWell(
                        onTap: () {
                          final dynamic tooltip = _toolTipKey.currentState;
                          tooltip.ensureTooltipVisible();
                        },
                        child: Tooltip(
                            key: _toolTipKey,
                            message: formatStatus(
                                this.orderListItem["currentStatus"]),
                            child: Icon(Icons.chevron_right,
                                size: 35, color: otpBlue)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ID",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                        ),
                        Text(orderListItem['orderID'],
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Booked on",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                        Text(
                          bookingDate,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expected delivery",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400)),
                          Text(
                            DateFormat('d MMM')
                                .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(orderListItem['orderID']))
                                    .add(Duration(days: 7)))
                                .toString(),
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "₹$totalPrice",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Divider(
              color: Colors.black26,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }

  String formatStatus(String str) {
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }

  void getPrice() {
    var garment = orderListItem['RfOrderItem'];
    for (var item in garment) {
      totalPrice += item["pricing"]["total_price"];
    }
  }

  void getdata() {
    var garment = orderListItem['RfOrderItem'];

    for (var item in garment) {
      if (garmentsname == "") {
        garmentsname = item["garment_details"]["garment_type"];
      } else {
        garmentsname =
            garmentsname + "" + ", " + item["garment_details"]["garment_type"];
      }

      int type = item["workType"];
      if (type == 0) {
        workType = "Stitching";
      } else {
        workType = "Alteration";
      }
    }

    var formatter = new DateFormat('d MMM');
    DateTime date = DateTime.parse(orderListItem['bookingDate']);
    bookingDate = formatter.format(date);
  }
}
