part of confirmvisit_view;

class _ConfirmvisitMobile extends StatefulWidget {
  final ConfirmvisitViewModel viewModel;

  _ConfirmvisitMobile(this.viewModel);

  @override
  __ConfirmvisitMobileState createState() => __ConfirmvisitMobileState();
}

class __ConfirmvisitMobileState extends State<_ConfirmvisitMobile> {
  DateTime selectedDate = DateTime.now();

  var selectedContainer = "11am - ";

  var selectedContainerday = "Today";

  DateTime seletedDateText = DateTime.now();

  var time = "11am - 12am";

  void initState() {
    super.initState();
    widget.viewModel.setTime(time);

    widget.viewModel.setDate(seletedDateText.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            width: double.infinity,
            child: FlatButton(
                onPressed: () async {
                  print(seletedDateText);
                  print(time);
                  widget.viewModel.confirm();
                },
                child: MjButtonWidget(
                  buttonText: "Continue",
                  padding: 8,
                )),
          ),
        ),
        appBar: AppBar(
            backgroundColor: appbarYellow,
            title: Text("Confirm visit"),
            leading: IconButton(
              tooltip: 'Previous choice',
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
          width: double.infinity,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assests/images/payment.png"),
          //       fit: BoxFit.cover),
          // ),
          child: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              color: Colors.transparent,
              axisDirection: AxisDirection.down,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(alignment: Alignment.centerLeft, children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 10),
                          child: Image(
                            image: AssetImage('assests/images/Ellipse.png'),
                            width: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Choose a date and time for home measurement",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 20),
                            child: Text(
                              "When",
                              style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 40),
                            child: Row(
                              children: <Widget>[
                                Text(DateFormat('d MMM yyyy, EEEE')
                                    .format(seletedDateText)),
                                // Text("${seletedDateText}".split(' ')[0]),
                                IconButton(
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: indicatorBlue,
                                  ),
                                  onPressed: () async {
                                    await _selectDate(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              dateWidget("Today", 0, j: 2),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: dateWidget("Tomorrow", 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: dateWidget(
                                    DateFormat('d MMM').format(
                                        selectedDate.add(Duration(days: 2))),
                                    2,
                                    j: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 30),
                        child: Text(
                          "What time",
                          style: TextStyle(
                              color: darkGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 20,bottom: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              timeWidget("09am - ", "10am"),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: timeWidget("11am - ", "12am"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: timeWidget("12pm - ", "01pm"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: timeWidget("01pm - ", "02pm"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: timeWidget("03pm - ", "04pm"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: timeWidget("04pm - ", "05pm"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: timeWidget("05pm - ", "06pm"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,

      locale: Locale("en"),
helpText: "Select Booking Date",
      initialDate: seletedDateText == null ? selectedDate : seletedDateText,
      firstDate: selectedDate.add(new Duration(days: -1)),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
               primaryColor: appbarYellow,
            accentColor: appbarYellow,
            accentColorBrightness: Brightness.dark,
            textSelectionColor: Colors.black,
            textTheme: TextTheme(
                headline1: TextStyle(color: Colors.black),
                headline4: TextStyle(color: Colors.black),
                headline5: TextStyle(color: Colors.black),
                headline3: TextStyle(color: Colors.black),
                bodyText1: TextStyle(color: Colors.black),
                overline: TextStyle(color: Colors.black),
                headline2: TextStyle(color: Colors.black)),
            colorScheme: ColorScheme.light(
              surface: Colors.black,
              primary: appbarYellow,
              secondary: Colors.black,
            ),
            buttonTheme: ButtonThemeData(highlightColor: Colors.white),
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        seletedDateText = picked;
        widget.viewModel.setDate(seletedDateText.toString());

        var today = DateFormat('d MMM, EEEE').format(new DateTime.now());
        var tom = DateFormat('d MMM, EEEE')
            .format(new DateTime.now().add(new Duration(days: 1)));
        var tomnext = DateFormat('d MMM, EEEE')
            .format(new DateTime.now().add(new Duration(days: 2)));
        var tomnextt = DateFormat('d MMM')
            .format(new DateTime.now().add(new Duration(days: 2)));
        var pickedvalue = DateFormat('d MMM, EEEE').format(picked);
        if (pickedvalue == today) {
          selectedContainerday = "Today";
        } else if (pickedvalue == tom) {
          selectedContainerday = "Tomorrow";
        } else if (pickedvalue == tomnext) {
          selectedContainerday = tomnextt;
        } else {
          selectedContainerday = picked.toString();
        }
      });
  }

  Widget dateWidget(String dateLabel, int day, {int j}) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(6),
      child: ClipRRect(
        child: InkWell(
          onTap: () {
            setState(() {
              selectedContainerday = dateLabel;
              if (j == null) {
                var date = selectedDate.add(new Duration(days: day));

                seletedDateText = date;
              } else {
                var date = selectedDate.add(new Duration(days: day));
                seletedDateText = date;
              }
              widget.viewModel.setDate(seletedDateText.toString());
            });
          },
          child: Container(
            color:
                selectedContainerday == dateLabel ? appbarYellow : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: new BoxConstraints(
                  minWidth: 100.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dateLabel,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    // prints Tuesday
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        j == null
                            ? DateFormat('d MMM, EEEE').format(
                                selectedDate.add(new Duration(days: day)))
                            : j != 1
                                ? "₹50-Extra charges"
                                : DateFormat('EEEE').format(
                                    selectedDate.add(new Duration(days: day))),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ), // prints Tuesday, 10 Dec, 2019
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget timeWidget(String fromtime, String totime) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(6),
      child: ClipRRect(
        child: InkWell(
          onTap: () {
            print(fromtime);
            setState(() {
              selectedContainer = fromtime;
              time = fromtime + totime;
              widget.viewModel.setTime(time.toString());
            });
          },
          child: Container(
            color: selectedContainer == fromtime ? appbarYellow : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: new BoxConstraints(
                  minWidth: 30.0,
                  maxWidth: 70.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      fromtime + totime,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
