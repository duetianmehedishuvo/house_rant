import 'package:farfromhome/utils/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutDevelopers extends StatelessWidget {
  Screen size;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue[700]);
    size = Screen(MediaQuery.of(context).size);
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.code,
              size: size.getWidthPx(20),
            ),
            SizedBox(
              width: size.getWidthPx(10),
            ),
            Text(
              'About Developers',
              style: TextStyle(fontFamily: 'Ex02'),
            ),
          ],
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.getWidthPx(10)),
              getDevCard(context, '', 'Nasrin Khan', '',
                  'Flutter Developer', 'mailto:knasrin235@gmail.com', 'assets/developers/nasrin.jpg'),
              SizedBox(height: size.getWidthPx(10)),
              getDevCard(context, '', 'Sumita Khatun', '',
                  'Flutter Developer', 'mailto:khansumikh@gmail.com', 'assets/developers/sumita.jpg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDevCard(var context, var _gitUrl, var _name, var _linkedinUrl, var _role, var _gmailUrl, var _imagePath) {
    return Container(
      width: size.wp(72),
      height: size.hp(43),
      child: Card(
        elevation: 6,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(size.getWidthPx(10)),
            child: Container(
                child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: size.hp(40),
                      width: size.wp(72),
                    ),
                    ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[700].withOpacity(0.9),
                        ),
                        height: size.hp(17),
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperOne(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[700].withOpacity(0.3),
                        ),
                        height: size.hp(18),
                      ),
                    ),
                    Positioned(
                      top: size.hp(7),
                      left: size.wp(20),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.all(Radius.circular(size.getWidthPx(69))),
                        child: Container(
                          color: Colors.white,
                          padding: new EdgeInsets.all(size.getWidthPx(8)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(size.getWidthPx(65))),
                            child: Image.asset(
                              _imagePath,
                              height: size.getWidthPx(110),
                              width: size.getWidthPx(110),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.hp(22),
                      left: size.wp(14),
                      child: Center(
                        child: Container(
                            padding: new EdgeInsets.fromLTRB(size.getWidthPx(6), size.getWidthPx(16), size.getWidthPx(16), size.getWidthPx(16)),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.getWidthPx(20),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _role,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: size.getWidthPx(16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(FontAwesomeIcons.solidEnvelope),
                                      onPressed: () async {
                                        var url = _gmailUrl;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Can't Lauch $url",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: size.getWidthPx(16));
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      icon: Icon(FontAwesomeIcons.linkedin),
                                      onPressed: () async {
                                        var url = _linkedinUrl;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Can't Lauch $url",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: size.getWidthPx(16));
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      icon: Icon(FontAwesomeIcons.github),
                                      onPressed: () async {
                                        var url = _gitUrl;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Can't Lauch $url",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: size.getWidthPx(16));
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
