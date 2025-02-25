part of fabricshops_view;

class FabricshopsMobile extends StatelessWidget {
  final FabricshopsViewModel viewModel;

  FabricshopsMobile(this.viewModel);

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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
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
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Fabric shops \nnear you",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(86),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Expanded(
                    flex: 3,
                    child: Container(
                      color: homepagegrey,
                      child: viewModel.shops != null
                          ? ScrollConfiguration(
                        behavior: ScrollBehavior(),
                        child: GlowingOverscrollIndicator(
                          axisDirection: AxisDirection.down,
                          color: Colors.transparent,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(
                                  height: 2,
                                ),
                            itemCount: viewModel.shops.length,
                            itemBuilder: (context, index) =>
                                FabricshopItemWidget(
                                  viewModel.shops[index],
                                ),
                          ),
                        ),
                      )
                          : Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme
                                  .of(context)
                                  .primaryColor),
                        ),
                      ),
                    )),
              ])),
    );
  }
}
