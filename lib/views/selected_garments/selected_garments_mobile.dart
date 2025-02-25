part of selected_garments_view;

class _SelectedGarmentsMobile extends StatefulWidget {
  final SelectedGarmentsViewModel viewModel;

  _SelectedGarmentsMobile(this.viewModel);

  @override
  __SelectedGarmentsMobileState createState() =>
      __SelectedGarmentsMobileState();
}

class __SelectedGarmentsMobileState extends State<_SelectedGarmentsMobile> {
  void initState() {
    super.initState();
    widget.viewModel.initalTotalPrice();
  }

  double totalPrice = 0;
  var commentData = "";
  var comment = "";
  bool isChecked = false;
  int previous_price, indexvalue;
  String selected;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to cancel order?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.slideInLeft, child:HomeView())),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    var selectedGarments = widget.viewModel.orderItem;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: lightgrey,
        appBar: AppBar(
          title: Text('Confirmation'),
        ),
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.transparent,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 40.0,
                    maxHeight: 40.0,
                    child: InkWell(
                      onTap: () async {
                        int dateFlag = 1;
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChooseLocationView(dateFlag)));
                        await widget.viewModel.getProfileData();
                      },
                      child: Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: widget.viewModel.userProfileData != null
                              ? addressHeader()
                              : Container(
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                )),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return SelectedgarmentsItemWidget(
                    selectedGarment: selectedGarments[index],
                    deleteGarment: (RfOrderItem model) async {
                      widget.viewModel.removeGarment(model);
                    },
                    customClicked: (RfOrderItem model) async {
                      print(model.toJson());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomiseOrder(
                                    viewModel: widget.viewModel,
                                    index: index,
                                  ),
                              fullscreenDialog: true));
                    },
                    switchValue: (bool val, int p1, int p2) {
                      print(val);
                      print(p1);
                      print(p2);
                      if (!val) {
                        widget.viewModel.setAlteration(index);
                      } else {
                        widget.viewModel.setStitching(index);
                        widget.viewModel.orderItem[index].pricing.totalPrice =
                            widget
                                .viewModel.orderItem[index].pricing.stitchPrice;
                        widget.viewModel.orderItem[index].pricing.addOnPrice =
                            0;
                        widget.viewModel.s.clear();
                      }
                    },
                  );
                }, childCount: selectedGarments.length)),
                SliverFillRemaining(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: new NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: Text(
                                  '*Final prize will be decided by our executive by seeing your fabric and design.'),
                            ),
                            Text("₹" + widget.viewModel.totalPrice.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: ScreenUtil().setSp(48))),
                          ],
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(top: 30, bottom: 20),
                        //   color: Colors.white,
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       Row(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: <Widget>[
                        //           Text('Apply Coupon',
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.w600,
                        //                   fontSize: 18)),
                        //           Container(
                        //             width: 100,
                        //             height: 20,
                        //             margin: const EdgeInsets.only(
                        //               left: 10.0,
                        //             ),
                        //             child: new TextField(
                        //               decoration: new InputDecoration(
                        //                 hintText: 'Try First "50"',
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       Text("Apply",
                        //           style: TextStyle(
                        //               color: indicatorBlue,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 18)),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Any comments for our tailor',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: ScreenUtil().setSp(48))),
                                InkWell(
                                  onTap: () {
                                    showCommentDialog();
                                  },
                                  child: Text("Comment",
                                      style: TextStyle(
                                          color: indicatorBlue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenUtil().setSp(48))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          comment,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SvgPicture.asset(
                            'assests/images/promise.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: agreeAndConfirmView(),
      ),
    );
  }

  Row addressHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.location_on),
        Text(
          "Pickup from -" +
              widget.viewModel.userProfileData['address']['houseNo'] +
              "," +
              widget.viewModel.userProfileData['address']['building'] +
              "," +
              widget.viewModel.userProfileData['address']['city'] +
              "," +
              widget.viewModel.userProfileData['address']['landmark'],
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: indicatorBlue,
        ),
      ],
    );
  }

  Container agreeAndConfirmView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: isChecked,
                        checkColor: Colors.white,
                        activeColor: appbarYellow,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked = value;
                            print(value);
                          });
                        },
                      ),
                      Text(
                        "I agree",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      InkWell(
                        onTap: _launchURL,
                        child: Text(
                          " Terms and conditions",
                          style: TextStyle(
                              color: otpBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Opacity(
                  opacity: isChecked ? 1 : 0.7,
                  child: InkWell(
                    child: MjButtonWidget(
                      buttonText: "Confirm",
                      padding: 4,
                    ),
                    onTap: isChecked
                        ? () {
                            print("tapped");
                            widget.viewModel.onConfirm();
                          }
                        : null,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = TERMS_CONDITION;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: new Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 230.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(0xFFFFFF),
                  borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // dialog top
                    new Expanded(
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            // padding: new EdgeInsets.all(10.0),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                            ),
                            child: new Text(
                              'Comment',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // dialog centre
                    new Expanded(
                      child: new TextField(
                        controller: TextEditingController()..text = commentData,
                        autofocus: true,
                        autocorrect: false,
                        maxLines: 10,
                        minLines: 10,
                        onChanged: (value) {
                          setState(() {
                            commentData = value;
                            print(commentData);
                          });
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          hintMaxLines: 10,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: "Comment",
                        ),
                      ),
                      flex: 2,
                    ),

                    // dialog bottom
                    new Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new FlatButton(
                            color: appbarYellow,
                            onPressed: () async {
                              widget.viewModel.getComment(commentData);
                              setState(() {
                                comment = commentData;
                              });
                              Navigator.pop(context);
                            },
                            child: new Text(
                              'Ok',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
