import 'package:farfromhome/LocalBindings.dart';
import 'package:farfromhome/ui/page_other_services_details.dart';
import 'package:farfromhome/utils/Constants.dart';
import 'package:farfromhome/utils/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class PageOtherServices extends StatefulWidget {
  @override
  _PageOtherServicesState createState() => _PageOtherServicesState();

  PageOtherServices();
}

class _PageOtherServicesState extends State<PageOtherServices> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Screen size;
  SearchBar searchBar;
  bool hasPermission;

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(title: new Text('Other Services'), backgroundColor: Colors.blue[700]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
  }

  getPermission() async {
    String userKey = (await LocalStorage.sharedInstance.loadUserRef(Constants.userRef));
    hasPermission = userKey == "GAXI6r4i4PGzmBj9KjXq"
        ? true
        : userKey == "0SaeQQ01vVUyHvc9eseq"
            ? true
            : userKey == "SMfCmkpDaeqNmeF81fy3"
                ? true
                : userKey == "dfo9CrJs7wCyAhDJOEF4"
                    ? true
                    : false;
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue[700]);
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        body: Container(
          width: size.screenSize.width,
          height: size.screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => PageOtherServicesDetails(servicesLists[0], hasPermission)));
                      },
                      child: Text('House Cleaner'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => PageOtherServicesDetails(servicesLists[1], hasPermission)));
                      },
                      child: Text('plumber Contact'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => PageOtherServicesDetails(servicesLists[2], hasPermission)));
                      },
                      child: Text('Internet Service Provider Contact'),
                      color: Colors.blue,
                      textTheme: ButtonTextTheme.normal,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => PageOtherServicesDetails(servicesLists[3], hasPermission)));
                      },
                      child: Text('Dish Connection Provider Contact'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => PageOtherServicesDetails(servicesLists[4], hasPermission)));
                      },
                      child: Text('Daily Labor Finder'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => PageOtherServicesDetails(servicesLists[5], hasPermission)));
                      },
                      child: Text('Electrician Contact'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
            ],
          ),
        ));
  }
}
