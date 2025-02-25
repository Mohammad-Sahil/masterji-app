part of auth_phone_view;

class _AuthPhoneMobile extends StatefulWidget {
  final AuthPhoneViewModel viewModel;

  _AuthPhoneMobile(this.viewModel);

  @override
  __AuthPhoneMobileState createState() => __AuthPhoneMobileState();
}

class __AuthPhoneMobileState extends State<_AuthPhoneMobile> {
  String phoneNumController;

  bool _btnEnabled = false;
  double _opacity = 0.6;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: homepagegrey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Image(
                            image: AssetImage('assests/images/Ellipse.png'),
                          ),
                        ),
                        Flexible(child: Image.asset('assests/images/icons.png'))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            MyFlutterApp.mobi,
                            size: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              "Enter your \nmobile number",
                              style: TextStyle(
                                  height: 1.1,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(4),
                            child: ClipRRect(
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    autovalidate: true,
                                    onChanged: (value) {
                                      this.phoneNumController = value;
                                      if (value.length == 10) {
                                        setState(() {
                                          _btnEnabled = true;
                                          _opacity = 1;
                                        });
                                      } else {
                                        setState(() {
                                          _btnEnabled = false;
                                          _opacity = 0.6;
                                        });
                                      }
                                    },
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    cursorColor: Colors.yellow,
                                    decoration: new InputDecoration(
                                      hintText: "Mobile number",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                                "If you are registered, we'll recognize you"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: InkWell(
                        // :null
                        onTap: _btnEnabled == true
                            ? () async {
                                bool response = await widget.viewModel
                                    .verifyPhoneNumber(phoneNumController);
                                // print(response);
                                // if (!response) {
                                //   await widget.viewModel
                                //       .onPhoneComplete(phoneNumController);
                                // }
                              }
                            : () {},
                        child: Opacity(
                          opacity: _opacity,
                          child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assests/images/btnbgfillwidth.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  ('Continue'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
