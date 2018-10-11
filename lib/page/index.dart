import 'package:flutter/material.dart';

class Index extends StatelessWidget{
  Index({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('主页'),
      ),
    );
  }

}