import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farfromhome/ui/first_screen.dart';
import 'package:farfromhome/ui/page_other_service_add.dart';
import 'package:farfromhome/utils/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> servicesLists = [
  'House Cleaner',
  'plumber Contact',
  'Internet Service Provider Contact',
  'Dish Connection Provider Contact',
  'Daily Labor Finder',
  'Electrician Contact'
];

class PageOtherServicesDetails extends StatefulWidget {
  final String title;
  final bool hasParmisssion;

  PageOtherServicesDetails(this.title, this.hasParmisssion);

  @override
  _PageOtherServicesDetailsState createState() => _PageOtherServicesDetailsState();
}

class _PageOtherServicesDetailsState extends State<PageOtherServicesDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Screen size;
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(title: new Text(widget.title), backgroundColor: Colors.blue[700], actions: [
      widget.hasParmisssion
          ? FlatButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => PageOtherServiceAdd(widget.title)));
              },
              icon: Icon(FontAwesomeIcons.plus, size: size.getWidthPx(16), color: Colors.white),
              label: Text('Add', style: TextStyle(color: Colors.white)))
          : SizedBox.shrink()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        //FirebaseFirestore.instance.collection("Services").doc(finalService).collection(finalService)
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Services').doc(widget.title).collection(widget.title).snapshots(),
            builder: (context, snapshot) {
              return (snapshot.connectionState == null || !snapshot.hasData)
                  ? new Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue[700],
                      ),
                    )
                  : Container(
                      padding: new EdgeInsets.fromLTRB(size.getWidthPx(10), size.getWidthPx(10), size.getWidthPx(10), 0),
                      child: ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot docsSnap = snapshot.data.docs[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              getUserCard(docsSnap, context),
                            ],
                          );
                        },
                      ),
                    );
            }));
  }

  Widget getUserCard(DocumentSnapshot docsSnap, var context) {
    size = Screen(MediaQuery.of(context).size);
    return Container(
      margin: new EdgeInsets.only(bottom: size.getWidthPx(10)),
      child: new Card(
        elevation: 4,
        borderOnForeground: true,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (_)=> ProfilePage('/User/'+docsSnap.id,true)));
            // Fluttertoast.showToast(msg: "Card Tapped ${docsSnap['firstName']} ${docsSnap['lastName']}" );
          },
          child: Container(
            width: size.wp(90),
            height: size.hp(22),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.symmetric(vertical: size.getWidthPx(12), horizontal: 10),
                      child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset('assets/icons/avatar.png')),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: size.getWidthPx(12), horizontal: size.getWidthPx(2)),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${docsSnap['firstName']} ${docsSnap['lastName']}',
                                style: TextStyle(
                                    fontFamily: 'Ex02',
                                    fontSize: size.getWidthPx(20),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                            SizedBox(height: size.getWidthPx(5)),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.mapMarkerAlt, size: size.getWidthPx(16), color: Colors.grey),
                                docsSnap.data().containsKey("address")
                                    ? Text(
                                        "${docsSnap['address']}",
                                        style: TextStyle(color: Colors.grey, fontSize: size.getWidthPx(16)),
                                      )
                                    : Text("Bangladesh", style: TextStyle(color: Colors.grey, fontSize: size.getWidthPx(16))),
                              ],
                            ),
                            SizedBox(height: size.getWidthPx(5)),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.mailBulk, size: size.getWidthPx(16), color: Colors.grey),
                                docsSnap.data().containsKey("email")
                                    ? Text(
                                        " ${docsSnap['email']}",
                                        style: TextStyle(color: Colors.grey, fontSize: size.getWidthPx(16)),
                                      )
                                    : Text("Bangladesh", style: TextStyle(color: Colors.grey, fontSize: size.getWidthPx(16))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: new EdgeInsets.symmetric(horizontal: size.getWidthPx(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: size.getWidthPx(40),
                        height: size.getWidthPx(40),
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(size.getWidthPx(20)),
                          border: new Border.all(width: size.getWidthPx(1), color: Colors.transparent),
                          color: Colors.greenAccent.shade700,
                        ),
                        child: Center(
                          child: IconButton(
                            tooltip: "Call",
                            icon: Icon(
                              FontAwesomeIcons.phoneAlt,
                              size: size.getWidthPx(17),
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              var url = "tel:" + docsSnap['mobileNo'].toString();
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Can't Lauch Phone",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: size.getWidthPx(15));
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: size.getWidthPx(12)),
                      Container(
                        width: size.getWidthPx(40),
                        height: size.getWidthPx(40),
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(size.getWidthPx(20)),
                          border: new Border.all(width: size.getWidthPx(1), color: Colors.transparent),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child: IconButton(
                              tooltip: "Chat",
                              icon: Icon(
                                FontAwesomeIcons.solidComment,
                                size: size.getWidthPx(17),
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                Fluttertoast.showToast(
                                    msg: "Start Chatting with ${docsSnap['firstName']}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: size.getWidthPx(15));
                                var url = "sms:" + docsSnap['mobileNo'].toString();
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Can't Lauch Phone",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: size.getWidthPx(15));
                                }
                              }),
                        ),
                      ),
                      SizedBox(width: size.getWidthPx(10)),
                      Container(
                        width: size.getWidthPx(40),
                        height: size.getWidthPx(40),
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(size.getWidthPx(20)),
                          border: new Border.all(width: size.getWidthPx(1), color: Colors.transparent),
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: IconButton(
                            tooltip: "Email",
                            icon: Icon(
                              Icons.mail,
                              size: size.getWidthPx(17),
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              Fluttertoast.showToast(
                                  msg: "Open Mail Address ${docsSnap['email']}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: size.getWidthPx(15));
                              var url = 'mailto:${docsSnap['email']}';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Can't Launch Mail",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: size.getWidthPx(15));
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.getWidthPx(2)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
