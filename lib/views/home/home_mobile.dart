part of home_view;

class _HomeMobile extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Profile", MyFlutterApp.profile),
    new DrawerItem("Orders", MyFlutterApp.orders),
    new DrawerItem("FAQ's", MyFlutterApp.faq),
    new DrawerItem("Fashion Consultants", MyFlutterApp.fashion),
    new DrawerItem("Fabric shops", MyFlutterApp.fabric),
    new DrawerItem("About", Icons.info_outline),
  ];
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  __HomeMobileState createState() => __HomeMobileState();
}

class __HomeMobileState extends State<_HomeMobile> {
  int _selectedDrawerIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomepageView();
      // case 1:
      //   return new ProfileView();
      // case 2:
      //   return new OrdersView();
      // case 3:
      //   return new FaqView();
      // case 4:
      //   return new FashionconsultantsView();
      // case 5:
      //   return new FabricshopsView();
      // case 6:
      //   return new AboutusView();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileView()));
    } else if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrdersView()));
    } else if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FaqView()));
    } else if (index == 4) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FashionconsultantsView()));
    } else if (index == 5) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FabricshopsView()));
    } else if (index == 6) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutusView()));
    } else {
      setState(() => _selectedDrawerIndex = index);
      Navigator.of(context).pop();
    } // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(
          d.icon,
          color: Colors.black,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: new Text(
            d.title,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarYellow,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Masterji",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.60,
          child: new Drawer(
            child: Container(
              color: appbarYellow,
              child: new Column(
                children: <Widget>[new Column(children: drawerOptions)],
              ),
            ),
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
