import 'package:flutter/material.dart';

import 'package:flutter_app/utils/Refresh.dart';
import 'package:flutter_app/home/index.dart';

class Index extends StatefulWidget {
  var parentContext;
  Index({Key key, this.title,this.parentContext}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new _DataList();

}

class _DataList extends State<Index> {
  Key key = GlobalKey();
  int _counter = 20;

  Future<Null> getData() {
    setState(() {
      _counter += 10;
      if (_counter > 40) {
        isnomore = true;
      }
    });
    return Future.delayed(Duration(milliseconds: 500), () {});
  }

  Future<Null> reset() {
    setState(() {
      list.clear();
      _counter = 20;
      isnomore = false;
    });
    return Future.delayed(Duration(milliseconds: 500), () {});
  }
  openNew(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new homeIndex();
    },));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.alarm,color: Colors.white,), onPressed: openNew)
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: RefreshLayout(
                canloading: !isnomore,
                child: new ListView(
                  children: _listBuilder(_counter),
                ),
                key: key,
                onRefresh: (boo) {
                  if (!boo) {
                    return getData();
                  } else {
                    return reset();
                  }
                },
                loadingBuilder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("正在加载中..."),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



  bool isnomore = false;

  final List<String> list = [];

  List<Widget> _listBuilder(int i) {
    final List<Widget> listw = [];
    if (list.isEmpty) {
      for (int i = 0; i < 1000; i++) {
        list.add(i.toString());
      }
    }
    for (int count = 0; count < i; count++) {
      listw.add(Container(
        margin: const EdgeInsets.only(
          top: 20.0,
        ),
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        height: 100.0,
        child: new Row(
          children: <Widget>[
            new Text("列表:"+list[count]),
            new Icon(Icons.add),
          ],
        ),
        decoration: new BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.red,
            )
          )
        ),
      ));
    }
    listw.add(
      Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Center(child: Text(!isnomore ? "" : '我是有底线的'))),
    );
    return listw;
  }
}
