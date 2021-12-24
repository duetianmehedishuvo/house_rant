import 'package:farfromhome/ui/first_screen.dart';
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

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(title: new Text('Other Services'), backgroundColor: Colors.blue[700]);
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
                      },
                      child: Text('House Cleaner'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
                      },
                      child: Text('plumber Contact'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
                      },
                      child: Text('Dish Connection Provider Contact'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
                      },
                      child: Text('Daily Labor Finder'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10))),
              Container(
                  width: size.screenSize.width * 0.7,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
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
