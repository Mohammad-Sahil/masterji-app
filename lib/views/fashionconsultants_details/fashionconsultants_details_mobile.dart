part of fashionconsultants_details_view;

class _FashionconsultantsDetailsMobile extends StatelessWidget {
  final FashionconsultantsDetailsViewModel viewModel;

  final FashionConsultants consultants;

  _FashionconsultantsDetailsMobile(this.viewModel, this.consultants);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: _body(context),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: FlatButton(
              onPressed: () => {
                viewModel.FashionBookingCall(consultants)
                // viewModel.onBoardingComplete(),
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SvgPicture.asset('assests/images/btnbgfullwidth.svg',
                      semanticsLabel: 'Next'),
                  Text(
                    'Book a video call',
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

  Widget _body(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.transparent,
        child: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assests/images/fabricshopscrop.png",
                    width: MediaQuery.of(context).size.width,
                    height: ScreenUtil().setHeight(560),
                    fit: BoxFit.fill,
                  ),
                  Row(children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: ScreenUtil().setSp(110),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 40),
                                    child: Text(
                                      consultants.expertise,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(60),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 8),
                                    child: Hero(
                                      tag:
                                          consultants.userId + consultants.name,
                                      child: Text(
                                        consultants.name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: ScreenUtil().setSp(86),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 8),
                                    child: Text(
                                      "र " +
                                          consultants.rate.toString() +
                                          "/hr",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ]),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 25),
                              child: Hero(
                                tag: consultants.userId,
                                child: Container(
                                    width: 120.0,
                                    height: 120.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new NetworkImage(
                                                consultants.userImage)))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Text(
                "Work Experience",
                style: TextStyle(
                    color: darkGrey, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8),
              child: Text(
                consultants.workExperience,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: 'Helvatica',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8),
              child: Text(
                "Work Samples",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 150.0,
                child: new ListView.separated(
                  separatorBuilder: (context,index)=>SizedBox(width: ScreenUtil().setWidth(26),),
                  scrollDirection: Axis.horizontal,
                  itemCount: consultants.workSample.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Image.network(
                      consultants.workSample[index],
                      width: 80,
                      height: 80,
                    );
                    //     CachedNetworkImage(
                    //   imageUrl: consultants.workSample[index],
                    //   imageBuilder: (context, imageProvider) => Container(
                    //     width: 80,
                    //     height: 80,
                    //   ),
                    //   placeholder: (context, url) => CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
