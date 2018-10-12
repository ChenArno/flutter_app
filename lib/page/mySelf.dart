import 'package:flutter/material.dart';

class MySelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    //拖动块
    Widget background = new Container(
        color: Colors.red,
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Material(
                child: new ClipOval(
                  child: new Image.asset(
                    'images/person.png',
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                elevation: 40.0,
                color: Color.fromRGBO(255, 255, 255, 0.4),
              ),
            ),
          ],
        ));

    Widget textSection = new Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(32.0),
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.red,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          bottomLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
          bottomRight: const Radius.circular(10.0),
        ),
      ),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578
 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          background,
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
