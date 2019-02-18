import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_profle_application/Helper/Model.dart';
import 'package:flutter_profle_application/Pages/DetailsPage.dart';

class GeneralCell extends StatefulWidget {

  Model cellItem;

  GeneralCell(this.cellItem);

  @override
  _GeneralCellState createState() => new _GeneralCellState();
}

class _GeneralCellState extends State<GeneralCell> {

  double calc_width = 0.0;
  double calc_height = 0.0;

  String photo = "";

  @override
  Widget build(BuildContext context) {

    this.calc_height = MediaQuery.of(context).size.height;
    this.calc_width = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.orangeAccent,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          GestureDetector(
           child: _getImage(),
           onTap: _goTo, // NOT _goTo() !!!!!!
          ),
          // _getExpandableText()
          _getText(),
        ],
      ),
    );// card
  }

  _getImage(){
    return Padding(
      padding: EdgeInsets.only(top: calc_height * 0.022, bottom: calc_height * 0.014),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            boxShadow: const[BoxShadow(color: Colors.grey, blurRadius: 18.0)],
            borderRadius: new BorderRadius.circular(calc_height * 0.069),
          border: Border.all(
            width: 2.0,
            color: Colors.blueGrey,
          ),
        ),
        child: Hero(
          tag: widget.cellItem.pathToImage,
          child: CircleAvatar(
            backgroundImage: new AssetImage(widget.cellItem.pathToImage),
            backgroundColor: Colors.black,
            radius: calc_height * 0.06,
          ),
        ),
      ),
    );
  }

  _getText(){
    return Container(
        child:
        Center(
            child:
            Text(widget.cellItem.name,
                style: TextStyle(color: Colors.blueGrey)
            )
        )
    );
  }


  _goTo(){

    // slow down animation
    timeDilation = 2.0;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(widget.cellItem)
        )
    );
  }

/*
  // UI Bug
  _getExpandableText(){
    return ConfigurableExpansionTile(
      headerExpanded: Flexible(child: Center(child: Text("I live in", style: TextStyle(color: Colors.blueGrey)))),
      header: Container(child: Center(child: Text(widget.cellItem.name,style: TextStyle(color: Colors.blueGrey)))),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(widget.cellItem.location, style: TextStyle(color: Colors.blueGrey)),
        ),
      ],
    );
  }
*/

}