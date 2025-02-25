part of aboutus_view;

class _AboutusMobile extends StatefulWidget {
  final AboutusViewModel viewModel;

  _AboutusMobile(this.viewModel);

  @override
  __AboutusMobileState createState() => __AboutusMobileState();
}

class __AboutusMobileState extends State<_AboutusMobile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
        Stack(
          children: <Widget>[
            Image.asset(
              "assests/images/fabricshopscrop.png",
              width: ScreenUtil.screenWidth,
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
                  padding: EdgeInsets.all(ScreenUtil().setWidth(32)),
                  child: Text(
                    "About \nus",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(86),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
        Expanded(

            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: (widget.viewModel.about != null)
                  ? ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Colors.transparent,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            itemCount: widget.viewModel.about.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.viewModel.about[index].heading,
                                      style: TextStyle(
                                          fontFamily: 'Helvatica',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        widget.viewModel.about[index].content,
                                        style: TextStyle(
                                            fontFamily: 'Helvatica',
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                            height: 1.4,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                    )),
            )),
      ])),
    );
  }
}
