import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterji_user_app/utilities/colors.dart';
import 'package:masterji_user_app/views/fabricshops/fabricshops_view.dart';
import 'package:masterji_user_app/views/selected_garments/selected_garments_view_model.dart';

class CustomiseOrder extends StatefulWidget {
  final SelectedGarmentsViewModel viewModel;
  final int index;

  const CustomiseOrder({Key key, this.viewModel, this.index}) : super(key: key);

  @override
  _CustomiseOrderState createState() => _CustomiseOrderState();
}

class _CustomiseOrderState extends State<CustomiseOrder> {
  @override
  void initState() {
    super.initState();
    //widget.viewModel.orderItem[widget.index].pricing.addOnPrice = 0;
    // widget.viewModel.orderItem[widget.index].pricing.totalPrice =
    //     widget.viewModel.orderItem[widget.index].pricing.stitchPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customisation"),
      ),
      body: SingleChildScrollView(child: widgetBody()),
      bottomNavigationBar: bottomWidget(context),
    );
  }

  Padding bottomWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assests/images/btnbgfullwidth.svg',
              semanticsLabel: 'Next',
              fit: BoxFit.cover,
            ),
            Text(
              "Continue",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget widgetBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: new Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CachedNetworkImage(
                                  imageUrl: widget
                                      .viewModel
                                      .orderItem[widget.index]
                                      .garmentDetails
                                      .icon,
                                  height: 60,
                                  width: 60,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    backgroundColor: Colors.grey,
                                    strokeWidth: 1, //
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    widget.viewModel.orderItem[widget.index]
                                        .garmentDetails.garmentType,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18)),
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0),
                                //   child: Text("What we provide",
                                //       style: TextStyle(
                                //           color: darkblue,
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: 14)),
                                // ),
                              ]),
                        ),
                      ],
                    ),
                    Text(
                        "₹" +
                            widget.viewModel.orderItem[widget.index].pricing
                                .totalPrice
                                .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ]),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Select Stiching Type",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "₹" +
                                widget.viewModel.orderItem[widget.index].pricing
                                    .addOnPrice
                                    .toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.height / 9,
                            child: InkWell(
                              onTap: () {},
                              child: stitchingType(
                                widget.viewModel.orderItem[widget.index]
                                    .stitchingCategory[0].subCategory,
                                "${widget.viewModel.orderItem[widget.index].stitchingCategory[0].price}",
                              ),
                            )),
                        Flexible(
                          child: stitchingType(
                            widget.viewModel.orderItem[widget.index]
                                .stitchingCategory[1].subCategory,
                            "${widget.viewModel.orderItem[widget.index].stitchingCategory[1].price}",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Stitching process",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(56),
                      fontWeight: FontWeight.w600),
                ),
              ),
              FutureBuilder(
                  future: widget.viewModel.getStitchingProcess(widget.index),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.none &&
                        snap.hasData == null) {
                      //print('project snapshot data is: ${projectSnap.data}');
                      return Container(
                        height: 10,
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Html(data: """ ${snap.data ?? ""} """),
                      );
                    }
                  }),
              Divider(
                color: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assests/images/fabric.png",
                    height: 80.w,
                    width: 80.w,
                    fit: BoxFit.fill,
                  ),
                  Flexible(
                      child: Padding(
                    padding:
                        EdgeInsets.only(top: 20.w, left: 28.w, right: 26.w),
                    child: Text(
                      "Purchase ${widget.viewModel.orderItem[widget.index].garmentDetails.garmentType.toLowerCase()} fabric from nearest shop",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(56)),
                    ),
                  )),
                  DottedBorder(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FabricshopsView())),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Find shops",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: indicatorBlue,
                                  fontSize: ScreenUtil().setSp(46))),
                        ),
                      ),
                    ),
                    color: indicatorBlue,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                  )
                ],
              )
            ]),
      ),
    );
  }

  Widget stitchingType(String label, String price) {
    return InkWell(
      onTap: () {
        var selected = widget
            .viewModel.orderItem[widget.index].selectedCategory[0].subCategory;
        // if (selected == label) {
        //   print("remove");
        //   widget.viewModel.removeAddOn(widget.index);
        // } else {
        //   print("add");

        //   widget.viewModel.selectAddOn(label, price, widget.index);
        // }
        //print(label);
        //print(widget.viewModel.orderItem[widget.index].selectedCategory[0].subCategory);

        if (widget.viewModel.s.contains(label)) {
          widget.viewModel.s.remove(label);
          widget.viewModel.removeAddOn(widget.index, price);
          print("remove");
        } else {
          widget.viewModel.s.add(label);
          widget.viewModel.selectAddOn(label, price.toString(), widget.index);
          print("add");
        }
        setState(() {});
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 9,
        margin: EdgeInsets.only(right: 4),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(6),
          child: ClipRRect(
            child: Container(
              color: widget.viewModel.s.contains(label)
                  ? appbarYellow
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ConstrainedBox(
                  constraints: new BoxConstraints(
                    minWidth: 100.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        label,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      // prints Tuesday
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "₹" + price,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ), // prints Tuesday, 10 Dec, 2019
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
