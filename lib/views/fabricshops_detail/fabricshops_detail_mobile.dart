part of fabricshops_detail_view;

class _FabricshopsDetailMobile extends StatelessWidget {
  final FabricshopsDetailViewModel viewModel;
  final FabricShops shops;
  _FabricshopsDetailMobile(this.viewModel, this.shops);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: homepagegrey,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      "assests/images/fabricshopscrop.png",
                      width: MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(560),
                      fit: BoxFit.fill,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: ScreenUtil().setSp(110),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 20),
                          child: Text(
                            shops.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(86),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8),
                          child: Text(
                            shops.shopName,
                            style: TextStyle(
                                color: darkGrey,
                                fontSize: 18,
                                fontFamily: 'Helvatica',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Text(
                    "Shop variety",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Text(
                    shops.shopVariety,
                    style: TextStyle(
                        fontFamily: 'Helvatica',
                        color: Color(0xff696969),
                        fontSize: 16,
                        height: 1.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Text(
                    "Work Samples",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: new ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: shops.fabricSample.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new Image.network(
                          shops.fabricSample[index],
                          width: 80,
                          height: 80,
                        );
                        //     CachedNetworkImage(
                        //   imageUrl: shops.fabricSample[index],
                        //   imageBuilder: (context, imageProvider) => Container(
                        //     width: 80,
                        //     height: 80,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.rectangle
                        //     ),

                        //   ),
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) =>
                        //       Icon(Icons.error),
                        // );
                      },
                    ),
                  ),
                ),
              ]),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: FlatButton(
              onPressed: () async {
                await launchMap(shops.address);
                // viewModel.onBoardingComplete(),
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SvgPicture.asset('assests/images/btnbgfullwidth.svg',
                      semanticsLabel: 'Get Directions'),
                  Text(
                    'Get Directions',
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

  Future launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }
}
