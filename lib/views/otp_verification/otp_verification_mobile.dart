part of otp_verification_view;

final FirebaseAuth _auth = FirebaseAuth.instance;

class _OtpVerificationMobile extends StatefulWidget {
  final OtpVerificationViewModel viewModel;
  final String phone;
  _OtpVerificationMobile(this.viewModel, this.phone);

  @override
  __OtpVerificationMobileState createState() => __OtpVerificationMobileState();
}

class __OtpVerificationMobileState extends State<_OtpVerificationMobile> {
  String otp1, otp2, otp3, otp4, otp5, otp6;
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 120;

  int currentSeconds = 0;
  String _verificationId;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    _verifyPhoneNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: homepagegrey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Enter \nOTP",
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
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assests/images/otprec.svg',
                                        allowDrawingOutsideViewBox: true,
                                        semanticsLabel: 'Next'),
                                    SizedBox(
                                      width: 20,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(1),
                                        ],
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          otp1 = value;
                                          if (value.isEmpty) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                          FocusScope.of(context).nextFocus();
                                        },
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        cursorColor: Colors.yellow,
                                        decoration: new InputDecoration(
                                          hintText: "0",
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
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assests/images/otprec.svg',
                                        allowDrawingOutsideViewBox: true,
                                        semanticsLabel: 'Next'),
                                    SizedBox(
                                      width: 20,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(1),
                                        ],
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          otp2 = value;
                                          if (value.isEmpty) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                          FocusScope.of(context).nextFocus();
                                        },
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        cursorColor: Colors.yellow,
                                        decoration: new InputDecoration(
                                          hintText: "0",
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
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assests/images/otprec.svg',
                                        allowDrawingOutsideViewBox: true,
                                        semanticsLabel: 'Next'),
                                    SizedBox(
                                      width: 20,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(1),
                                        ],
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          otp3 = value;
                                          if (value.isEmpty) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                          FocusScope.of(context).nextFocus();
                                        },
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        cursorColor: Colors.yellow,
                                        decoration: new InputDecoration(
                                          hintText: "0",
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
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assests/images/otprec.svg',
                                        allowDrawingOutsideViewBox: true,
                                        semanticsLabel: 'Next'),
                                    SizedBox(
                                      width: 20,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(1),
                                        ],
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          otp4 = value;
                                          if (value.isEmpty) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                          FocusScope.of(context).nextFocus();
                                        },
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        cursorColor: Colors.yellow,
                                        decoration: new InputDecoration(
                                          hintText: "0",
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
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assests/images/otprec.svg',
                                        allowDrawingOutsideViewBox: true,
                                        semanticsLabel: 'Next'),
                                    SizedBox(
                                      width: 20,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(1),
                                        ],
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          otp5 = value;
                                          if (value.isEmpty) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                          FocusScope.of(context).nextFocus();
                                        },
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        cursorColor: Colors.yellow,
                                        decoration: new InputDecoration(
                                          hintText: "0",
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
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assests/images/otprec.svg',
                                        allowDrawingOutsideViewBox: true,
                                        semanticsLabel: 'Next'),
                                    SizedBox(
                                      width: 20,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(1),
                                        ],
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          otp6 = value;
                                          if (value.isEmpty) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                          FocusScope.of(context).unfocus();
                                        },
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        cursorColor: Colors.yellow,
                                        decoration: new InputDecoration(
                                          hintText: "0",
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
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                  "An OTP has been sent to ${widget.phone}"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: InkWell(
                                    onTap: currentSeconds == 120
                                        ? () async {
                                            _verifyPhoneNumber();
                                            startTimeout();
                                          }
                                        : null,
                                    child: Text(
                                      "Resend OTP",
                                      style: (TextStyle(
                                          fontSize: 18,
                                          color: currentSeconds == 120
                                              ? indicatorBlue
                                              : indicatorBlue.withOpacity(0.6),
                                          fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                Text(timerText)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                      child: InkWell(
                        onTap: () {
                          var otpCode = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
                          print(otpCode);
                          //widget.viewModel.verifyOTP(otpCode);
                          _signInWithPhoneNumber(otpCode);
                        },
                        //onTap: () => viewModel.verifyOTP(),
                        child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assests/images/btnbgfillwidth.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: double.infinity, //wo aai ni
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                ('Continue'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }

  void _signInWithPhoneNumber(String otp) async {
    //String otp = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    if (user.uid == currentUser.uid) {
      widget.viewModel.navToLocation();
    } else {
      widget.viewModel.navToError();
    }
  }

  void _verifyPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) async {
      print('Received phone auth credential: $phoneAuthCredential');
      widget.viewModel.navToLocation();
      final AuthResult authResult =
          await _auth.signInWithCredential(phoneAuthCredential);
      final FirebaseUser user = authResult.user;
      final FirebaseUser currentUser = await _auth.currentUser();
      if (user.uid == currentUser.uid) {
        widget.viewModel.navToLocation();
      }
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');

      widget.viewModel.navToError();
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      print('Please check your phone for the verification code.');
      widget.viewModel.optSend(widget.phone);
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: widget.phone,
        timeout: const Duration(seconds: 120),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
