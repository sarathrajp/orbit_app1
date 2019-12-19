import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orbit_app/Apis/Networkutil.dart';
import 'package:orbit_app/Apis/Responsemodels/AddResponse.dart';
import 'package:orbit_app/Apis/RestDatasource.dart';
import 'package:orbit_app/Constant/Constants.dart';
import 'package:orbit_app/Constant/HexColor.dart';
import 'package:orbit_app/Response_Api/LoginResponse.dart';
import 'package:orbit_app/admin/models/CustomMenu.dart';
import 'package:orbit_app/admin/models/DocumentItem.dart';
import 'package:orbit_app/admin/models/DriverItem.dart';
import 'package:orbit_app/admin/models/ProjectItem.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orbit_app/entry/Login.dart';

import '../MenuFile.dart';
import '../ProjectListing.dart';
class Driver_listCon extends StatefulWidget {
  Driver_listCon(this.title,this.list) : super();

  final List<DocumentItem>  list;
  final String title;
  @override
  _DrawerfileState createState() => _DrawerfileState();
}

class _DrawerfileState extends State<Driver_listCon> {
  List drawerItemModel;
  TextStyle style = TextStyle(fontFamily: Constants.font, fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold );
  TextStyle style1 = TextStyle(fontFamily: Constants.font, fontSize: 14.0,color:Colors.black,fontWeight: FontWeight.bold );
  double due_amount=234;
  double paid_amount=34566;
  double payable_amount=34566;

  @override
  void initState() {
    super.initState();
    addDrawerItem2();
  }


  addDrawerItem2() {
    drawerItemModel=new List();
    drawerItemModel=widget.list;
  }


  @override
  Widget build(BuildContext context) {
    var itemsize_h = MediaQuery
        .of(context)
        .size
        .height;
    var itemsize_w = MediaQuery
        .of(context)
        .size
        .width;
    var itemsize_w2 = MediaQuery
        .of(context)
        .size
        .width / 2;

    makeMsg(BuildContext context, String msg) {
      print("call snackbar");
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


    buildItem(BuildContext context, DocumentItem choice) {
      print("----choice----");
      print(choice.image_name);
      print(choice.document);
      print(choice.type);
      return
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            (choice.image_name != null) && (choice.image_name.trim() != "") ?

            Container(
                width: itemsize_w2 / 3.1,
                height: itemsize_w2 / 3.1,
                //color: HexColor(Constants.white),
                // alignment: Alignment.center,
                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            RestDatasource.BASEIMAGE_URL3 + choice.image_name)
                    )
                )) :
            Container(
              width: itemsize_w2 / 3.1,
              height: itemsize_w2 / 3.1,
              color: HexColor(Constants.white),
              alignment: Alignment.center,
              child: new CircleAvatar(
                  backgroundColor: HexColor(Constants.greycolor),
                  child: new Icon(
                    Icons.person, color: HexColor(Constants.dark_gray),),
                  radius: itemsize_w2 / 8
              ),
            ),

            SizedBox(
              width: 5,
            ),
            // Expanded(child: Icon(choice.icon, size:90.0, color: textStyle.color)),
          ],
          //child: new Tab(text: 'New Projects'),
        );
    }





    Future<void> _dialogCall(BuildContext context,DocumentItem choice) {
      return showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: MaterialLocalizations.of(context)
              .modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext,
              Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: Container(
                width: itemsize_w,
                height: itemsize_h,
                padding: EdgeInsets.all(20),
                color: Colors.transparent,
                child: Column(
                  children: [

                    RaisedButton(

                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "CLOSE",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: HexColor(Constants.warncolor),
                    ),
                    (choice.image_name != null) && (choice.image_name.trim() != "") ?

                    Container(
                        width: itemsize_w,
                        height: itemsize_h/1.5 ,
                        //color: HexColor(Constants.white),
                        // alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    RestDatasource.BASEIMAGE_URL3 + choice.image_name)
                            )
                        )) :
                    Container(
                      width: itemsize_w ,
                      height: itemsize_h/1.5 ,
                      color: HexColor(Constants.white),
                      alignment: Alignment.center,
                      child: new CircleAvatar(
                          backgroundColor: HexColor(Constants.greycolor),
                          child: new Icon(
                            Icons.person, color: HexColor(Constants.dark_gray),),
                          radius: itemsize_w2 / 8
                      ),
                    ),

                    SizedBox(
                      width: 5,
                    ),
                    // Expanded(child: Icon(choice.icon, size:90.0, color: textStyle.color)),
              Container(
                width: itemsize_w ,
                color: HexColor(Constants.white),
                alignment: Alignment.center,
                child:
                   new Text(choice.document, style: style),
              )
                  ],
                ),
              ),
            );
          });
    }

    makebody2() {
      return drawerItemModel.length>0? new Container(
        child: Wrap(
            children: <Widget>[
              new SizedBox(
                height: 10.0,
              ),
              Container(
                width: itemsize_w,
                color: HexColor(Constants.warncolor),
                padding: const EdgeInsets.only(
                    right: 10, bottom: 4, top: 4, left: 10),
                child: new Text(widget.title, textAlign: TextAlign.left,
                  style: new TextStyle(fontFamily: Constants.font,
                      fontSize: 16.0,
                      color: HexColor(Constants.white),
                      fontWeight: FontWeight.normal),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,),

              ),
              Container(
                margin: EdgeInsets.all(8.0),
                color: Colors.white,
                // child:  new Text( product_list.length.toString()),
                child: new ListView.builder(
                    shrinkWrap: true,
                    itemCount: drawerItemModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _dialogCall(context, drawerItemModel[index]);
                          });
                        },
                        child: buildItem(context, drawerItemModel[index]),
                      );
                    }
                ),

              ),
             // :new Container(),


            ]),
      ):new Container();
    }
    return makebody2();
  }
}
