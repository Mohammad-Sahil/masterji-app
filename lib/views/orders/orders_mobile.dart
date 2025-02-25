part of orders_view;

class _OrdersMobile extends StatefulWidget {
  final OrdersViewModel viewModel;

  _OrdersMobile(this.viewModel);

  @override
  __OrdersMobileState createState() => __OrdersMobileState();
}

class __OrdersMobileState extends State<_OrdersMobile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 1080,height: 1920, allowFontScaling: true);
    return SafeArea(
      child: Scaffold(
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  "assests/images/fabricshopscrop.png",
                  width: MediaQuery.of(context).size.width,
                  height: ScreenUtil().setHeight(520),
                  fit: BoxFit.fill,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 36,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Orders",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(76),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: widget.viewModel.orderlist != null
                          ? Container(
                              color: Colors.white,
                              child: widget.viewModel.orderlist.length != 0
                                  ? ListView.builder(
                                      itemCount:
                                          widget.viewModel.orderlist.length,
                                      itemBuilder: (context, index) =>
                                          OrderItemWidget(
                                        widget.viewModel.orderlist[index].data,
                                      ),
                                    )
                                  : Text("No upcoming orders"),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Theme.of(context).primaryColor),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),

            // Flexible(
            //     fit: FlexFit.loose,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(bottom: 8.0),
            //             child: Text(
            //               "Past Orders",
            //               style: TextStyle(fontSize: 18),
            //             ),
            //           ),
            //           Flexible(
            //             child: widget.viewModel.orderlist != null
            //                 ? Container(
            //                     height:
            //                         MediaQuery.of(context).size.height * 0.4,
            //                     color: Colors.white,
            //                     child: widget.viewModel.orderlist.length != 0
            //                         ? ListView.builder(
            //                             itemCount: widget.viewModel.orderlist.length,
            //                             itemBuilder: (context, index) =>
            //                                 OrderItemWidget(
            //                               widget.viewModel.orderlist[index].data,
            //                             ),
            //                           )
            //                         : Text("No past orders"),
            //                   )
            //                 : Center(
            //                     child: CircularProgressIndicator(
            //                       valueColor: AlwaysStoppedAnimation(
            //                           Theme.of(context).primaryColor),
            //                     ),
            //                   ),
            //           )
            //         ],
            //       ),
            //     )),
          ])),
    );
  }
}
