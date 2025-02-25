part of profile_view;

class _ProfileMobile extends StatefulWidget {
  final ProfileViewModel viewModel;

  _ProfileMobile(this.viewModel);

  @override
  __ProfileMobileState createState() => __ProfileMobileState();
}

class __ProfileMobileState extends State<_ProfileMobile> {
  String name;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: 
        <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                "assests/images/fabricshopscrop.png",
                width: double.infinity,
                fit: BoxFit.fill,
                height: ScreenUtil().setHeight(560),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: ScreenUtil().setSp(110),
                  ),
                  onPressed: () => Navigator.pop(context)),
              Positioned(
                top: ScreenUtil().setHeight(150),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Your \nProfile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(76),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                  (widget.viewModel.userProfileData == null ||
                                          widget.viewModel
                                                  .userProfileData['name'] ==
                                              null)
                                      ? "Unknown"
                                      : widget
                                          .viewModel.userProfileData['name'],
                                  style: TextStyle(
                                      fontFamily: 'Helvatica',
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTapDown: (detail) {
                          new Future.delayed(const Duration(seconds: 0), () {
                            showNameDialog();
                          });
                        },
                        onTap: () {
                          print("clicked");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            "Edit",
                            style: TextStyle(color: indicatorBlue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                  (widget.viewModel.userProfileData == null ||
                                          widget.viewModel.userProfileData[
                                                  'address']['address'] ==
                                              null)
                                      ? "Unknown"
                                      : widget.viewModel
                                              .userProfileData['address']
                                          ['address'],
                                  style: TextStyle(
                                      fontFamily: 'Helvatica',
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        int dateFlag = 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChooseLocationView(dateFlag)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          "Edit",
                          style: TextStyle(color: indicatorBlue),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mobile number",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                (widget.viewModel.userProfileData == null ||
                                        widget.viewModel
                                                .userProfileData['contact'] ==
                                            null)
                                    ? "Unknown"
                                    : widget
                                        .viewModel.userProfileData['contact'],
                                style: TextStyle(
                                    fontFamily: 'Helvatica',
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  void showNameDialog() {
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
                              'Update name',
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
                      child: new Container(
                          child: new TextFormField(
                        autocorrect: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: "Your name",
                        ),
                        onSaved: (String newValue) {},
                      )),
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
                              await widget.viewModel.saveName(
                                name: name,
                              );
                              if (widget.viewModel.status != null &&
                                  widget.viewModel.status == true) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: new Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.white,
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
