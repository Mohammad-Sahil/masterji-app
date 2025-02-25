part of order_customize_view;

class _OrderCustomizeMobile extends StatefulWidget {
  final OrderCustomizeViewModel viewModel;
final double totalPrice;

  _OrderCustomizeMobile(this.viewModel,this.totalPrice);

  @override
  __OrderCustomizeMobileState createState() => __OrderCustomizeMobileState();
}

class __OrderCustomizeMobileState extends State<_OrderCustomizeMobile> {
  var selectedData;

  @override
  Widget build(BuildContext context) {
    var model = widget.viewModel.garmentModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Customization'+widget.viewModel.previousprice.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
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
                                    imageUrl: model.garmentDetails.icon,
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
                                  Text(model.garmentDetails.garmentType,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text("What we provide",
                                        style: TextStyle(
                                            color: darkblue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14)),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      Text(
                          "₹" + widget.viewModel.afterCustomisePrice.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ]
                    ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.stitchingCategory.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Select ${model.stitchingCategory[index].category}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "₹" +
                                        model.stitchingCategory[index]
                                            .selectedprice,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 9,
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 4),
                                shrinkWrap: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: model.stitchingCategory[index]
                                    .categoryDetails.length,
                                itemBuilder: (ctx, j) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (model
                                                .stitchingCategory[index]
                                                .categoryDetails[j]
                                                .isSelected !=
                                            true) {
                                          model.stitchingCategory[index]
                                              .categoryDetails
                                              .forEach((element) =>
                                                  element.isSelected = false);
                                        }
                                        selectedData = model
                                            .stitchingCategory[index]
                                            .categoryDetails[j]
                                            .subcategory;
                                        if (model
                                                .stitchingCategory[index]
                                                .categoryDetails[j]
                                                .isSelected !=
                                            true) {
                                          model
                                              .stitchingCategory[index]
                                              .categoryDetails[j]
                                              .isSelected = true;
                                          model.stitchingCategory[index]
                                                  .selectedprice =
                                              model.stitchingCategory[index]
                                                  .categoryDetails[j].price
                                                  .toString();

                                          widget.viewModel.addCustomistaion(
                                              model.stitchingCategory[index]
                                                  .categoryDetails[j],index);
                                        } else {
                                          model
                                              .stitchingCategory[index]
                                              .categoryDetails[j]
                                              .isSelected = false;
                                          model.stitchingCategory[index]
                                              .selectedprice = "0";
                                          widget.viewModel.removeCustomisation(
                                              model.stitchingCategory[index]
                                                  .categoryDetails[j],index);
                                        }
                                        
                                            
                                      
                                      });
                                    },
                                    child: stitchingType(
                                        model.stitchingCategory[index]
                                            .categoryDetails[j].subcategory,
                                        "₹${model.stitchingCategory[index].categoryDetails[j].price}",
                                        model.stitchingCategory[index]
                                            .categoryDetails[j]),
                                  );
                                }),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Stitching process",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            var orderItem = widget.viewModel.getOrderItem();
            
            Navigator.pop(context, orderItem);
            print(orderItem);
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
      ),
    );
  }

  Widget stitchingType(String label, String price, CategoryDetail category) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(6),
        child: ClipRRect(
          child: Container(
            color: category.isSelected ? appbarYellow : Colors.white,
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
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    // prints Tuesday
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        price,
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
    );
  }
}
