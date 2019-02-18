import 'package:flutter/material.dart';
import 'package:flutter_profle_application/Helper/Model.dart';
import 'package:flutter_profle_application/Helper/Provider.dart';
import 'package:flutter_profle_application/Widgets/CustomBottomBar.dart';
import 'package:flutter_profle_application/Widgets/GeneralCell.dart';

class GeneralPage extends StatefulWidget {

  final String title;

  GeneralPage(this.title);

  @override
  _GeneralPageState createState() => new _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {

  double calc_width = 0.0;
  double calc_height = 0.0;

  Provider provider;
  List <Model> list;

  int counter = 0;

  @override
  Widget build(BuildContext context) {

    _init();

    return Scaffold(
      appBar: _getAppBar(),
      body: _getGeneralGrid(),
      bottomNavigationBar: CustomBottomBar("general"),
    );
  }

  // init page
  _init(){
    if(counter == 0){
      // create test data  only ones
      this.provider = Provider();
      this.list = provider.createTestData();

      // check screen size
      this.calc_height = MediaQuery.of(context).size.height;
      this.calc_width = MediaQuery.of(context).size.width;
    }
    counter++;
  }

  _getPadding(double param){
    return EdgeInsets.only(left: calc_width*param, right: calc_width*param);
  }

  _getAppBar(){
    return AppBar(
      title: Text(widget.title, style: TextStyle(color: Colors.blueGrey)),
      backgroundColor: Colors.white,
    );
  }

  _getGeneralGrid(){

    return Padding(
      // padding: EdgeInsets.only(left: calc_width*0.02, right: calc_width*0.02),
      padding: _getPadding(0.02),
      child: _getGrid_locked(),
    );
  }

  // orientation locked
  _getGrid_locked(){
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: _getGridDelegate(),
          delegate: _getSliverDelegate(),
        )
      ],
    );
  }

  // Build Grid out of slivers
  _getGridDelegate(){
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
    );
  }

  // Build Slivers out of the list
  _getSliverDelegate(){
    return SliverChildBuilderDelegate((BuildContext context, int index){
          return GeneralCell(list[index]);
        },
        childCount: list.length
    );
  }
}
