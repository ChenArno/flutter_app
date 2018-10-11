import 'package:flutter/material.dart';

class Shopping extends StatelessWidget{
  Shopping({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        centerTitle: true,
      ),
      body: new ListView(
        children:[
          new Image.asset(
            'images/bizhi.jpg',
            width: 300.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          
        ]
      ),
    );
  }

}