part of fashion_consultant_booking_success_view;

class _FashionConsultantBookingSuccessMobile extends StatelessWidget {
  final FashionConsultantBookingSuccessViewModel viewModel;
  final Map bookingDetails;
  _FashionConsultantBookingSuccessMobile(this.viewModel, this.bookingDetails);
  final DateFormat format = new DateFormat("EEEE, dd MMM yyyy");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(
                        'assests/images/fashionConsultantBookingSuccess.png',
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.15),
                                  child: Text(
                                    "Video call \n booked",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w900),
                                  ))))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Image.network(
                        bookingDetails['consultantImage'],
                        width: 60,
                        height: 60,
                      ),
                      // CachedNetworkImage(
                      //   imageUrl: bookingDetails['consultantImage'],
                      //   imageBuilder: (context, imageProvider) => Container(
                      //     width: 60,
                      //     height: 60,
                      //   ),
                      //   placeholder: (context, url) => CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 6),
                        child: Text(
                          bookingDetails['consultantName'],
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          bookingDetails['expertise'],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        format
                            .format(
                                DateTime.parse(bookingDetails['bookingDate']))
                            .toString(),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        bookingDetails['bookingTime'].toString().toUpperCase(),
                        
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "You’ll receive a meeting link in a text message 10 min prior to the scheduled call.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InkWell(
                          child: MjButtonWidget(
                            buttonText: "Home",
                            padding: 8,
                          ),
                          onTap: () async {
                            await viewModel.gotoHome();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
