import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farfromhome/ui/page_other_services_details.dart';
import 'package:farfromhome/utils/utils.dart';
import 'package:farfromhome/widgets/auth_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';

// SIGNUP STARTS HERE
class PageOtherServiceAdd extends StatefulWidget {
  final String serviceName;

  PageOtherServiceAdd(this.serviceName);

  @override
  _PageOtherServiceAddState createState() => _PageOtherServiceAddState();
}

class _PageOtherServiceAddState extends State<PageOtherServiceAdd> {
  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _location;
  String _phoneNo;
  String _fname;
  String _lname;
  String _nidFiled;
  Screen size;

  final DocumentReference documentReference = FirebaseFirestore.instance.collection("Services").doc();

  // adding data to fire store

  void _add() async {
    Map<String, dynamic> data = <String, dynamic>{
      "firstName": _fname,
      "lastName": _lname,
      "mobileNo": _phoneNo,
      "email": _email,
      "address": _location,
      "nid": _nidFiled,
      "status": true,
      "Date Created": DateTime.now()
    };
    String service = widget.serviceName;
    String finalService = service == servicesLists[0]
        ? servicesLists[0]
        : service == servicesLists[1]
            ? servicesLists[1]
            : service == servicesLists[2]
                ? servicesLists[2]
                : service == servicesLists[3]
                    ? servicesLists[3]
                    : service == servicesLists[4]
                        ? servicesLists[4]
                        : servicesLists[5];

    FirebaseFirestore.instance.collection("Services").doc(finalService).collection(finalService).doc().set(data).whenComplete(() {
      Fluttertoast.showToast(msg: "Data Added Successfully");
      _formKey.currentState.reset();
    }).catchError((e) => print(e.toString()));
  }

  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (validateAndSave()) {
      try {
        _add();
      } catch (e) {
        //print("error : $e");
        Fluttertoast.showToast(msg: e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue[700].withOpacity(1));
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: size.hp(20),
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0x221976d2), Color(0x221976d2)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: size.hp(20),
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0x441976d2), Color(0x441976d2)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: size.getWidthPx(10)),
                            child: Text(
                              'Add ' + widget.serviceName,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: size.getWidthPx(18)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: size.hp(20),
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff1976d2), Color(0xff1976d2)])),
                  ),
                ),
                Positioned(
                  top: -5,
                  left: -5,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    tooltip: 'Close Screen',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.hp(2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.wp(6)),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  cursorColor: Colors.blue[900],
                  decoration: InputDecoration(
                      hintText: "First Name",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.person,
                          color: Colors.blue[700],
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: size.wp(2.5), vertical: size.hp(2))),
                  validator: (value) => value.isEmpty ? "First Name can't be empty" : null,
                  onSaved: (value) => _fname = value,
                ),
              ),
            ),
            SizedBox(
              height: size.hp(2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.wp(6)),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  cursorColor: Colors.blue[900],
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.person,
                          color: Colors.blue[700],
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: size.wp(2.5), vertical: size.hp(2))),
                  validator: (value) => value.isEmpty ? "Last Name can't be empty" : null,
                  onSaved: (value) => _lname = value,
                ),
              ),
            ),
            SizedBox(
              height: size.hp(2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.wp(6)),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.blue[900],
                  decoration: InputDecoration(
                      hintText: "Mobile Number",
                      prefixText: "+88",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.phone_android,
                          color: Colors.blue[700],
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: size.wp(2.5), vertical: size.hp(2))),
                  validator: (value) => value.isEmpty ? "Mobile Number can't be empty" : null,
                  onSaved: (value) => _phoneNo = "+88" + value,
                ),
              ),
            ),
            SizedBox(
              height: size.hp(2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.wp(6)),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  cursorColor: Colors.blue[900],
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.email,
                          color: Colors.blue[700],
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: size.wp(2.5), vertical: size.hp(2))),
                  validator: (value) => value.isEmpty ? "Email can't be empty" : null,
                  onSaved: (value) => _email = value,
                ),
              ),
            ),
            SizedBox(height: size.hp(2)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.wp(6)),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blue[900],
                  decoration: InputDecoration(
                      hintText: "Nid",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(Icons.insert_drive_file_outlined, color: Colors.blue[700]),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: size.wp(2.5), vertical: size.hp(2))),
                  validator: (value) => value.isEmpty ? "NID can't be empty" : null,
                  onSaved: (value) => _nidFiled = value,
                ),
              ),
            ),
            SizedBox(height: size.hp(2)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.hp(3)),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  cursorColor: Colors.blue[800],
                  decoration: InputDecoration(
                      hintText: "Address",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.local_florist_outlined,
                          color: Colors.blue[700],
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: size.wp(2.5), vertical: size.hp(2))),
                  validator: (value) => value.isEmpty ? "Address can't be empty" : null,
                  onSaved: (value) => _location = value,
                ),
              ),
            ),
            SizedBox(
              height: size.hp(3),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.wp(6)),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color(0xff1976d2)),
                  child: FlatButton(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: size.hp(3)),
                    ),
                    onPressed: () {
                      validateAndSubmit();
                    },
                  ),
                )),
            SizedBox(height: size.hp(5)),
          ],
        ),
      ),
    );
  }
}
