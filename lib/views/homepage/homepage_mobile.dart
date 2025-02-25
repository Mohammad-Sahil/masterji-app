part of homepage_view;

class _HomepageMobile extends StatefulWidget {
  final HomepageViewModel viewModel;

  _HomepageMobile(this.viewModel);

  @override
  __HomepageMobileState createState() => __HomepageMobileState();
}

class __HomepageMobileState extends State<_HomepageMobile>
    with TickerProviderStateMixin {
  TabController _tabController;
  int ladiescount = 0, gentscount = 0;
  List<String> gentslist = new List();
  List<String> femalelist = new List();
  bool clearAll = false;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assests/images/homebg.png"),
                fit: BoxFit.cover),
            color: homepagegrey,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text("Select garments for stitching or alteration",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(76),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                  flex: 8,
                  child: DefaultTabController(
                    length: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Colors.black,
                          isScrollable: true,
                          tabs: [
                            Tab(
                              child: Container(
                                color: homepagegrey,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: _tabController.index == 0
                                          ? Image(
                                              image: AssetImage(
                                                  'assests/images/image.png'),
                                            )
                                          : Container(),
                                    ),
                                    Text(
                                      "Ladies",
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              // text: 'Ladies',
                            ),
                            Tab(
                              child: Container(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: _tabController.index == 1
                                          ? Image(
                                              image: AssetImage(
                                                  'assests/images/image.png'),
                                            )
                                          : Container(),
                                    ),
                                    Text(
                                      "Gents",
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        body: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: [
                            widget.viewModel.ladiesGarments == null
                                ? Center(child: CircularProgressIndicator())
                                : ((widget.viewModel.ladiesGarments != null &&
                                        widget.viewModel.ladiesGarments
                                                .length !=
                                            0))
                                    ? SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Wrap(
                                            runSpacing: 10,
                                            alignment:
                                                WrapAlignment.spaceEvenly,
                                            spacing: 10,
                                            children: getLadiesCatalog(widget
                                                .viewModel.ladiesGarments),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child:
                                            Text("Not availabe in your city")),
                            widget.viewModel.gentsGarments == null
                                ? Center(child: CircularProgressIndicator())
                                : ((widget.viewModel.gentsGarments != null &&
                                        widget.viewModel.gentsGarments.length !=
                                            0))
                                    ? SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Wrap(
                                            runSpacing: 10,
                                            alignment:
                                                WrapAlignment.spaceEvenly,
                                            spacing: 10,
                                            children: getGentsCatalog(
                                                widget.viewModel.gentsGarments),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child:
                                            Text("Not availabe in your city")),
                          ],
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (widget.viewModel.ladiesGarments.length != 0 &&
                              widget.viewModel.gentsGarments.length != 0) &&
                          (widget.viewModel.gentsGarments[0].cityAvailable &&
                              widget.viewModel.ladiesGarments[0].cityAvailable)
                      ? () async {
                          await widget.viewModel.naviagate();
                        }
                      : () => widget.viewModel.showError(),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assests/images/btnbgfullwidth.svg',
                          semanticsLabel: 'Next',
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "Book a tailor",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  List<Widget> getLadiesCatalog(List<GarmentModel> ladiesGarments) {
    List<Widget> widgetList = new List<Widget>();
    for (GarmentModel garmentModel in ladiesGarments) {
      widgetList.add(CatalogWidget(
        clearAll: clearAll,
        garments: garmentModel,
        garmentSelected: (GarmentModel garment, bool isSelected) {
          if (isSelected) {
            widget.viewModel.addGarmentToCart(garment);
          } else {
            widget.viewModel.removeGarmentFromCart(garment);
          }
        },
      ));
    }
    widgetList.add(
      Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: <Widget>[
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return CustomgarmentDialog(
                          selectedCustomGarment: femalelist,
                          customGarment: (List<String> value) {
                            widget.viewModel
                                .addLadiesCustomGarment(value, "FEMALE");
                            ladiescount = value.length;
                            value.forEach((element) {
                              femalelist.add(element);
                            });
                            setState(() {});
                          });
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 5),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: 60,
                      height: 60,
                      color: ladiescount >= 1 ? appbarYellow : Colors.white,
                      child: Image.asset(
                        'assests/images/plus.png',
                      ),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Custom Garment",
              style: TextStyle(fontSize: 9),
            ),
          )
        ],
      ),
    );
    return widgetList;
  }

  List<Widget> getGentsCatalog(List<GarmentModel> gentsGarments) {
    List<Widget> widgetList = new List<Widget>();
    for (GarmentModel garmentModel in gentsGarments) {
      widgetList.add(CatalogWidget(
        garments: garmentModel,
        clearAll: clearAll,
        garmentSelected: (GarmentModel garment, bool isSelected) {
          if (isSelected) {
            widget.viewModel.addGarmentToCart(garment);
          } else {
            widget.viewModel.removeGarmentFromCart(garment);
          }
        },
      ));
    }
    widgetList.add(
      Column(
        children: <Widget>[
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return CustomgarmentDialog(
                          selectedCustomGarment: gentslist,
                          customGarment: (List<String> value) {
                            widget.viewModel.addCustomGarment(value, "MALE");
                            gentscount = value.length;
                            value.forEach((element) {
                              gentslist.add(element);
                            });
                            setState(() {});
                          });
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 5),
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: gentscount >= 1 ? appbarYellow : Colors.white,
                        child: Image.asset('assests/images/plus.png',
                            width: 50, height: 60),
                      ),
                    )),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Custom Garment",
              style: TextStyle(fontSize: 9),
            ),
          )
        ],
      ),
    );
    return widgetList;
  }
}

class CustomgarmentDialog extends StatefulWidget {
  final Function(List<String>) customGarment;
  final List<String> selectedCustomGarment;
  CustomgarmentDialog({this.customGarment, this.selectedCustomGarment});
  @override
  _CustomgarmentDialogState createState() => new _CustomgarmentDialogState();
}

class _CustomgarmentDialogState extends State<CustomgarmentDialog> {
  var _count = 1;
  List<TextEditingController> _controllers = new List();

  void initState() {
    super.initState();

    if (widget.selectedCustomGarment.length != 0) {
      _count = 0;
      _controllers.clear();
      widget.selectedCustomGarment.forEach((element) {
        _count++;
        TextEditingController myController = TextEditingController()
          ..text = element;
        _controllers.add(myController);
      });
      widget.selectedCustomGarment.clear();
    } else {
      _controllers.add(new TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _newgarmentlist = List<String>.generate(_count, (index) {
      return "Item- ${new DateTime.now().millisecondsSinceEpoch} - $index";
    });
    //List<int> _newgarmentlist = new List.generate(_count, (int i) => new AddNewGarment(_count));
    return Container(
      height: double.maxFinite,
      child: AlertDialog(
        content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: double.maxFinite,
            height:
                Theme.of(context).platform == TargetPlatform.iOS ? 300.0 : 300,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // dialog top
                new Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Add custom garments',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                              'You can add any garment which are not listed',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                        ),
                      )
                    ],
                  ),
                ),

                // dialog centre
                new Expanded(
                  flex: 4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _newgarmentlist.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(_newgarmentlist[index]),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            _newgarmentlist.removeAt(index);
                          });
                        },
                        child: Row(children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              (index + 1).toString() + ".",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: TextFormField(
                              controller: _controllers[index],
                              decoration: new InputDecoration(
                                hintText: 'Like "Patiala suit"',
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: _newgarmentlist.length - 1 == index
                                  ? InkWell(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: otpBlue,
                                      ),
                                      onTap: (_controllers[index]
                                                  .value
                                                  .toString() !=
                                              "")
                                          ? _addNewGarmentRow
                                          : null,
                                    )
                                  : InkWell(
                                      onTap: () {
                                        //print(_newgarmentlist[index]);
                                        setState(() {
                                          _newgarmentlist
                                              .remove(_newgarmentlist[index]);
                                          _count--;
                                          _controllers.removeAt(index);
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        color: otpBlue,
                                      )))
                        ]),
                      );
                    },
                  ),
                ),

                // dialog bottom
                new Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          List<String> p = List();
                          _controllers.forEach((element) {
                            if (element.text != null ||
                                element.text.isNotEmpty) {
                              p.add(element.text);
                            }
                          });
                          widget.customGarment(p);
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new FlatButton(
                        color: appbarYellow,
                        onPressed: () async {
                          print(_controllers.length);
                          List<String> p = List();
                          _controllers.forEach((element) {
                            if (element.text != null ||
                                element.text.isNotEmpty) {
                              p.add(element.text);
                            }
                          });
                          widget.customGarment(p);
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
          );
        }),
      ),
    );
  }

  void _addNewGarmentRow() {
    setState(() {
      _count = _count + 1;
      _controllers.add(new TextEditingController());
    });
  }
}
