part of faq_view;

class _FaqMobile extends StatefulWidget {
  final FaqViewModel viewModel;

  _FaqMobile(this.viewModel);

  @override
  __FaqMobileState createState() => __FaqMobileState();
}

class __FaqMobileState extends State<_FaqMobile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
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
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "FAQs",
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
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: (widget.viewModel.faqs != null)
                  ? ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Colors.transparent,
                        child: ListView.builder(
                          itemCount: widget.viewModel.faqs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: ExpansionPanelList(
                                animationDuration: Duration(milliseconds: 500),
                                children: [
                                  ExpansionPanel(
                                    body: Container(
                                      // padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                  bottom: 8.0),
                                              child: Text(
                                                widget.viewModel.faqs[index]
                                                    .solution,
                                                    textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  fontFamily: 'Helvatica',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 12,
                                            bottom: 12),
                                        child: Text(
                                          widget.viewModel.faqs[index].ques,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Helvatica',
                                          ),
                                        ),
                                      );
                                    },
                                    isExpanded:
                                        widget.viewModel.faqs[index].isExpanded,
                                  )
                                ],
                                expansionCallback: (int item, bool status) {
                                  setState(() {
                                    widget.viewModel.faqs[index].isExpanded =
                                        !widget
                                            .viewModel.faqs[index].isExpanded;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Theme.of(context).primaryColor),
                      ),
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
