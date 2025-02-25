part of garmentordered_details_view;

class _GarmentorderedDetailsMobile extends StatefulWidget {
  final GarmentorderedDetailsViewModel viewModel;
  final Map<String, dynamic> mapData;
  var bookingaddress;

  _GarmentorderedDetailsMobile(this.viewModel, this.mapData);

  @override
  __GarmentorderedDetailsMobileState createState() =>
      __GarmentorderedDetailsMobileState();
}

class __GarmentorderedDetailsMobileState
    extends State<_GarmentorderedDetailsMobile> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await bookingDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.slideInLeft, child: HomeView()));
                return true;

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order details'),
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 20, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Order ID: " + widget.mapData['orderId'] ??
                                      "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(56),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.viewModel.garmentname,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil().setSp(36),
                                        fontFamily: "Helvatica",
                                        height: 1.5,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.expand_more,
                              color: darkblue,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    "Status",
                    style: TextStyle(
                      fontFamily: 'Helvatica',
                      fontSize: ScreenUtil().setSp(46),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.red,
                                  inactiveTrackColor: Colors.black,
                                  trackHeight: 1.0,
                                  thumbColor: Colors.yellow,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 14.0),
                                  overlayColor: appbarYellow.withAlpha(50),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 14.0),
                                ),
                                child: Slider(
                                  value: 200,
                                  max: 200,
                                  min: 200,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ),
                          // buildPadding()
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: buildPadding(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
          child: InkWell(
            onTap: () {},
            child: Opacity(
              opacity: 0.7,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assests/images/btnbgfullwidth.svg',
                    semanticsLabel: 'Next',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Pay",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pickup request booked.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          Text(widget.viewModel.orderTime ?? "",
              style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Preferred pickup",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(46),
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "${widget.viewModel.bookingDate}, ${widget.viewModel.bookingTime}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Preferred address",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(46),
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(widget.viewModel.bookingAddress ?? "",
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ),
              InkWell(
                onTap: () async {
                  int garmentaddress = 2;
                  var address = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChooseLocationView(garmentaddress)));
                  await widget.viewModel.updateAddress(address);
                },
                child: Text("Change",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: otpBlue)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Tailoring garments",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(46),
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
          ),
          Text(widget.viewModel.garmentname ?? "",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  bookingDialog(BuildContext context) async {
    var formatter = new DateFormat('EEEE, MMM d');
    DateTime date = DateTime.parse(
        widget.mapData['bookingDate'] ?? "2020-06-07 07:19:20.966055");
    String selectedDate = formatter.format(date);
    return await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Your tailoring request is booked for ' + selectedDate ?? "",
            style: TextStyle(fontSize: 18),
          ),
          content: const Text(
              'Soon, you’ll receive a status update when a executive will be assigned for home pickup.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.viewModel.showSuccess();
              },
            ),
          ],
        );
      },
    );
  }
}
