part of fabricshop_item_widget;

class _FabricshopItemMobile extends StatelessWidget {
  final FabricShops shops;
  const _FabricshopItemMobile({Key key, this.shops}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(shops.name);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FabricshopsDetailView(shops)));
      },
      child: Container(
        height: 80,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        shops.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(shops.shopName,
                          style: TextStyle(
                            fontFamily: 'Helvatica',
                            color: Colors.grey[700],
                            fontSize: 14,
                            height: 1.5
                          )),
                    ],
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.chevron_right,
                    color: indicatorBlue,
                    size: 36,
                  ),
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
