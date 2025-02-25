part of fashionconsultants_view;

class FashionconsultantsMobile extends StatelessWidget {
  final FashionconsultantsViewModel viewModel;

  FashionconsultantsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: homepagegrey,
          body: Column(
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
                        onPressed: () => Navigator.pop(context)),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Fashion \nConsultants",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(86),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Get on demand fashion consultation on video call. Our experts can customize dresses for any special event.",
                          style: TextStyle(
                              color: Color(0xff696969),
                              fontSize: ScreenUtil().setSp(46),
                              fontFamily: 'Helvatica',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
                child: Container(
                  color: homepagegrey,
                  child: viewModel.consultants != null
                      ? ScrollConfiguration(
                          behavior: ScrollBehavior(),
                          child: GlowingOverscrollIndicator(
                            axisDirection: AxisDirection.down,
                            color: Colors.transparent,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 2,
                              ),
                              itemCount: viewModel.consultants.length,
                              itemBuilder: (context, index) =>
                                  FashionconsulatntsItemWidget(
                                viewModel.consultants[index],
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).primaryColor),
                          ),
                        ),
                )),
          ])),
    );
  }
}
