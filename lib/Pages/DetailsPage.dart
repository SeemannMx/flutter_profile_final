import 'package:flutter/material.dart';
import 'package:flutter_profle_application/Helper/Model.dart';
import 'package:flutter_profle_application/Widgets/CustomBottomBar.dart';

class DetailsPage extends StatefulWidget {

  Model model_item;

  DetailsPage(@required this.model_item);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  double calc_width = 0.0;
  double calc_height = 0.0;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    _init();

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Details',style: TextStyle(color: Colors.blueGrey)),
      ),
      body: Column(
        children: <Widget>[
          _getStack(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar("detail").build(context)
    );
  }

  _init(){

    if(counter == 0) {
      this.calc_height = MediaQuery.of(context).size.height;
      this.calc_width = MediaQuery.of(context).size.width;
    }
    counter++;
  }

  _getStack(){
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            _getHeader(),
            _getSubHeader(),
            _getBody(),
          ],
        ),
        _getImage(),
      ],
    );
  }

  _getHeader(){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: calc_width * 0.05),
      height: calc_height* 0.20,
      width: calc_width,
      // color: Colors.blueGrey,
      child: Text("/* path to image */",style: TextStyle(color: Colors.grey))
    );
  }

  _getSubHeader(){
    return Container(
      // color: Colors.grey,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.blueGrey))
      ),
      child: Padding(
        padding: EdgeInsets.only(right: calc_width * 0.1, top: calc_width * 0.05, bottom: calc_width * 0.05),
        // child: Text("Sub-Header"),
        child: Text(widget.model_item.name, style: TextStyle(color: Colors.blueGrey, fontSize: calc_width * 0.08)),
      ),
    );
  }

  _getBody(){
    return Container(
      height: calc_height * 0.45,
         // color: Colors.greenAccent,
           child: Padding(
             padding: EdgeInsets.only(top: calc_height * 0.04, left: calc_height * 0.05, right: calc_height * 0.05),
               child: ListView(
                 shrinkWrap: true,
                 children: <Widget>[
                   _getInfos("Location :", widget.model_item.location),
                   _getInfos("Gender :", "..."),
                   _getInfos("Race :", "..."),
                   _getInfos("Age :", "..."),
                   _getInfos("Guest since :", "..."),
                   _getStory("History:\n"),
                 ],
               ),
             ),
     );
  }

  _getInfos(String tag, info){
    var height = calc_width* 0.15;
    var width = calc_width* 0.33;
    var padding = EdgeInsets.all(8.0);
    var fontsize = calc_height * 0.025;

    return Container(
      padding: EdgeInsets.only(left: calc_width*0.08),
      child:
      Row(
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Padding(
              padding: padding,
              child: Text(
                  tag,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: fontsize
                  )
              ),
            )
          ),
          Container(
              height: height,
              width: width,
              child: Padding(
                padding: padding,
                child: Text(
                    info,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: fontsize
                    )
                ),
            )
          ),
        ],
      ),
    );
  }

  _getStory(String text){
    String story = "...\n\n\n\n\n\n !!!";
    return Container(
      // color: Colors.blue,
        padding: EdgeInsets.only(left: calc_width*0.08),
        child: Padding(
          padding: EdgeInsets.only(top: calc_width*0.08, left: 8.0, right: 8.0),
          child:
          Text("$text$story",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: calc_height * 0.025
              )
          ),
        )
    );
  }

  _getImage(){
    return Padding(
      padding: EdgeInsets.only(top: calc_height * 0.10, left: calc_width* 0.12),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: const[BoxShadow(color: Colors.grey, blurRadius: 18.0)],
          borderRadius: new BorderRadius.circular(calc_width*0.20),
          border: Border.all(
            width: 2.0,
            color: Colors.white,
          ),
        ),
        child: Hero(
          tag: widget.model_item.pathToImage,
          child: CircleAvatar(
            backgroundImage: new AssetImage(widget.model_item.pathToImage),
            backgroundColor: Colors.black,
            radius: calc_width*0.18,
          ),
        ),
      ),
    );
  }
}
