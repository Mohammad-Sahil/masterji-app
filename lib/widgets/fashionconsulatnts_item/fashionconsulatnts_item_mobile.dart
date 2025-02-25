part of fashionconsulatnts_item_widget;

class _FashionconsulatntsItemMobile extends StatelessWidget {
  final FashionConsultants consultants;

  const _FashionconsulatntsItemMobile({Key key, this.consultants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(consultants.name);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FashionconsultantsDetailsView(consultants)));
      },
      child: Container(
        height: 90,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Hero(
                    tag: consultants.userId,
                    child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    new NetworkImage(consultants.userImage)))),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Hero(
                            tag: consultants.userId + consultants.name,
                            child: Text(
                              consultants.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(consultants.expertise,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Helvatica',
                                  color: Colors.grey,
                                  fontSize: 14,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )),
                RichText(
                    text: TextSpan(
                        text: "₹ ",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff696969)),
                        children: <TextSpan>[
                      TextSpan(
                          text: consultants.rate.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      TextSpan(
                          text: "/hr",
                          style: TextStyle(fontSize: 14, color: Colors.black))
                    ])),
                // Text("₹" + consultants.rate.toString() + "/hr",
                //     style: TextStyle(fontSize: 18, color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child:
                      Icon(Icons.chevron_right, color: indicatorBlue, size: 36),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
