part of choose_location_view;

class _ChooseLocationMobile extends StatefulWidget {
  final ChooseLocationViewModel viewModel;
  final int dateFlag;

  _ChooseLocationMobile(this.viewModel, this.dateFlag);

  @override
  __ChooseLocationMobileState createState() => __ChooseLocationMobileState();
}

class __ChooseLocationMobileState extends State<_ChooseLocationMobile> {
  String address;
  LatLng userLocation;
  static const LatLng DEFAULT_LAT_LNG = LatLng(12.972442, 77.580643);
  @override
  void initState() {
    _getThingsOnStartup().then((value) {
      pickPlace();
    });
    super.initState();
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }

  pickPlace() async {
    setState(() {});
    PlacePickerResult pickerResult = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlacePickerScreen(
                  googlePlacesApiKey: GOOGLE_PLACES_API_KEY,
                  initialPosition: DEFAULT_LAT_LNG,
                  mainColor: appbarYellow,
                  mapStrings: MapPickerStrings.english(),
                  placeAutoCompleteLanguage: 'en',
                )));

    try {
      setState(() {
        address = pickerResult.address;
        userLocation = pickerResult.latLng;
        sheet(context);
      });
    } catch (e) {}
  }

  final _formKey = GlobalKey<FormState>();
  sheet(context) {
    String building, hNo, landmark, pincode, city, state;
    showModalBottomSheet<void>(
        useRootNavigator: true,
        isDismissible: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: _onBackPressed,
            child: GestureDetector(
              onVerticalDragStart: (_) {},
              child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              20.0, 20.0, 20.0, 0.0), // content padding
                          child: Container(
                            child: Form(
                              key: _formKey,
                              child: new Wrap(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Text(
                                        "Your address will help us in faster pickup",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: DottedBorder(
                                        radius: Radius.circular(8),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter Building/Apartment';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) =>
                                              building = value,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          cursorColor: Colors.yellow,
                                          decoration: new InputDecoration(
                                            hintText: "Building/Apartment",
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: DottedBorder(
                                        radius: Radius.circular(8),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter House number';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) => hNo = value,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          cursorColor: Colors.yellow,
                                          decoration: new InputDecoration(
                                            hintText: "House number",
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: DottedBorder(
                                        radius: Radius.circular(8),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter Nearby landmark';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) =>
                                              landmark = value,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          cursorColor: Colors.yellow,
                                          decoration: new InputDecoration(
                                            hintText: "Nearby landmark",
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: DottedBorder(
                                        radius: Radius.circular(8),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter city';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) => city = value,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          cursorColor: Colors.yellow,
                                          decoration: new InputDecoration(
                                            hintText: "City",
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: DottedBorder(
                                        radius: Radius.circular(8),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter state';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) => state = value,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          cursorColor: Colors.yellow,
                                          decoration: new InputDecoration(
                                            hintText: "State",
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: DottedBorder(
                                        radius: Radius.circular(8),
                                        child: TextFormField(
                                          inputFormatters: [
                                            new LengthLimitingTextInputFormatter(
                                                6), // for mobile
                                          ],
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter pincode';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) => pincode = value,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          cursorColor: Colors.yellow,
                                          decoration: new InputDecoration(
                                            hintText: "pincode",
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        print(building);
                                        if (widget.dateFlag == 2) {
                                          await widget.viewModel
                                              .UpdateOrderAddress(
                                            address: address,
                                            building: building,
                                            hNo: hNo,
                                            landmark: landmark,
                                            city: city,
                                            pincode: pincode,
                                            state: state,
                                            userLocations: userLocation,
                                          );
                                        } else {
                                          await widget.viewModel.saveAddress(
                                              address: address,
                                              building: building,
                                              hNo: hNo,
                                              landmark: landmark,
                                              city: city,
                                              pincode: pincode,
                                              state: state,
                                              userLocations: userLocation,
                                              dateFlag: widget.dateFlag,
                                              context: context);
                                        }
                                      }
                                    },
                                    child: MjButtonWidget(
                                      buttonText: "Continue",
                                      padding: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )))),
            ),
          );
        });
    //.whenComplete(() => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarYellow,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  pickPlace();
                },
              );
            },
          ),
          title: Text(
            "Set pickup location",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: (address == null || address == "")
            ? Center(child: CircularProgressIndicator())
            : Container(),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.pop(context);
    Navigator.pop(context);
    return Future.value(true);
  }
}
