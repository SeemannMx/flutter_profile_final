import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {

  String widgetName;
  String menu_left;
  String menu_center;
  String menu_right;

  CustomBottomBar(this.widgetName);

  @override
  Widget build(BuildContext context) {

    if(widgetName == "general"){
      menu_left = "menu";
      menu_right = "donate";
      menu_center = "contact";
    } else if(widgetName == "detail"){
      menu_left = "menu";
      menu_center = "back";
      menu_right = "contact";
    }

    return
      SafeArea(
      child: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              _getMenu(context, menu_left),
              _getMenu(context, menu_center),
              _getMenu(context, menu_right),
          ],
        ),
      ),
    );
  }

  _getMenu(BuildContext context, String tag){
    return Container(
      child: FlatButton(
          child: Text(tag,style: TextStyle(color: Colors.blue)),
          onPressed: () {

          // button action
            if(tag == "back"){
              _back(context);
            } else if(tag == "menu"){
              print("$tag clicked");
            } else if(tag == "contact"){
              print("$tag clicked");
            } else if(tag == "donate"){
              print("$tag clicked");
            }
          }
      ),
    );
  }

  _back(BuildContext context){

    Navigator.pop(context);

  }
}
