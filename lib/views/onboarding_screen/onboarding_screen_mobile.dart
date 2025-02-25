part of onboarding_screen_view;

class _OnboardingScreenMobile extends StatelessWidget {
  final OnboardingScreenViewModel viewModel;

  _OnboardingScreenMobile(this.viewModel);
  final PageController _controller =
      PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homepagegrey,
        body: PageView(controller: _controller,
            // physics: new NeverScrollableScrollPhysics(),
            children: <Widget>[
              firstPage(),
              secondPage(),
              thirdPage(),
              fourthPage()
            ]),
      ),
    );
  }

  Widget firstPage() {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assests/images/onboarding11.png',
                  )),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0),
                    child: Column(
                      children: [
                        // Text(
                        //   "Select garments and book a tailor for it’s stitching.",
                        //   style: TextStyle(
                        //       fontStyle: FontStyle.normal,
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Choose your category from over 40 subcategories in “Men and Women” and curate your outfit book an appointment",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new DotsIndicator(
                            dotsCount: 4,
                            position: 0,
                            decorator: DotsDecorator(
                              shape: Border.all(color: indicatorBlue, width: 2),
                              activeSize: const Size(18.0, 9.0),
                              size: const Size(18.0, 9.0),
                              color: Colors.white,
                              activeColor: indicatorBlue,
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                              child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: FlatButton(
                              onPressed: () => {
                                this._controller.jumpToPage(1),
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  SvgPicture.asset('assests/images/btnbg.svg',
                                      semanticsLabel: 'Next'),
                                  Text(
                                    allTranslations.text('next'),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  flex: 1)
            ]),
      ),
    );
  }

  Widget secondPage() {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assests/images/onboarding21.png',
                  )),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text(
                        //   "After booking",
                        //   style: TextStyle(
                        //       fontStyle: FontStyle.normal,
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.grey),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top:8.0),
                        //   child: Text(
                        //     "A tailor will arrive at your \ndoorstep",
                        //     style: TextStyle(
                        //         fontStyle: FontStyle.normal,
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "A tailor at your doorsteps in the next hours",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new DotsIndicator(
                            dotsCount: 4,
                            position: 1,
                            decorator: DotsDecorator(
                              shape: Border.all(color: indicatorBlue, width: 2),
                              activeSize: const Size(18.0, 9.0),
                              size: const Size(18.0, 9.0),
                              color: Colors.white,
                              activeColor: indicatorBlue,
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                              child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: FlatButton(
                              onPressed: () => {
                                this._controller.jumpToPage(2),
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  SvgPicture.asset('assests/images/btnbg.svg',
                                      semanticsLabel: 'Next'),
                                  Text(
                                    allTranslations.text('next'),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  flex: 1)
            ]),
      ),
    );
  }

  Widget thirdPage() {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assests/images/onboarding31.png',
                  )),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // Text(
                        //   "Our expert will take your measurements",
                        //   style: TextStyle(
                        //       fontStyle: FontStyle.normal,
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Masterji experts will take your measurements so you can keep your measurements the way you want & collect your fabric.",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new DotsIndicator(
                            dotsCount: 4,
                            position: 2,
                            decorator: DotsDecorator(
                              shape: Border.all(color: indicatorBlue, width: 2),
                              activeSize: const Size(18.0, 9.0),
                              size: const Size(18.0, 9.0),
                              color: Colors.white,
                              activeColor: indicatorBlue,
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                              child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: FlatButton(
                              onPressed: () => {
                                this._controller.jumpToPage(3),
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  SvgPicture.asset('assests/images/btnbg.svg',
                                      semanticsLabel: 'Next'),
                                  Text(
                                    allTranslations.text('next'),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  flex: 1)
            ]),
      ),
    );
  }

  Widget fourthPage() {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assests/images/onboarding41.png',
                    fit: BoxFit.fitWidth,
                  )),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text(
                        //   "After 3-6 days,",
                        //   style: TextStyle(
                        //       fontStyle: FontStyle.normal,
                        //       fontSize: 18,
                        //       color: Colors.grey,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top:8.0),
                        //   child: Text(
                        //     "Stitched garment will be delivered at your doorstep ",
                        //     style: TextStyle(
                        //         fontStyle: FontStyle.normal,
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "A properly stitched attire woven with love and care to fit you perfectly will be delivered in 7 business days.",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new DotsIndicator(
                            dotsCount: 4,
                            position: 3,
                            decorator: DotsDecorator(
                              shape: Border.all(color: indicatorBlue, width: 2),
                              activeSize: const Size(18.0, 9.0),
                              size: const Size(18.0, 9.0),
                              color: Colors.white,
                              activeColor: indicatorBlue,
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                              child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: FlatButton(
                              onPressed: () => {
                                viewModel.onBoardingComplete(),
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  SvgPicture.asset('assests/images/btnbg.svg',
                                      semanticsLabel: 'Next'),
                                  Text(
                                    allTranslations.text('finish'),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  flex: 1)
            ]),
      ),
    );
  }
}
