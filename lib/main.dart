import 'package:flutter/material.dart';
import 'package:flutter_app/page/index.dart';
import 'package:flutter_app/page/mySelf.dart';
import 'package:flutter_app/page/classify.dart';
import 'package:flutter_app/page/shopping.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int page = 0;
  var tabImages;
  var appBarTitles = ['首页', '报警', '充电', '我的'];

  Image getBottomImage(path) {
    return new Image.asset(
      path,
      width: 30.0,
      height: 20.0,
    );
  }

  Image getIcon(int index) {
    if (index == page) {
      return tabImages[index][1];
    } else {
      return tabImages[index][0];
    }
  }

  Text getTabTitle(int index) {
    if (index == page) {
      return new Text(
        appBarTitles[index],
        style: new TextStyle(color: Colors.red),
      );
    } else {
      return new Text(
        appBarTitles[index],
        style: new TextStyle(color: Color(0xff888888)),
      );
    }
  }

  void initImage() {
    tabImages = [
      [
        getBottomImage('images/icon/tab-apply.png'),
        getBottomImage('images/icon/tab-apply1.png')
      ],
      [
        getBottomImage('images/icon/tab-alarm.png'),
        getBottomImage('images/icon/tab-alarm1.png')
      ],
      [
        getBottomImage('images/icon/tab-charg.png'),
        getBottomImage('images/icon/tab-charg1.png')
      ],
      [
        getBottomImage('images/icon/tab-my.png'),
        getBottomImage('images/icon/tab-my1.png')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    initImage();
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new PageView(
        children: <Widget>[
          new Index(title: appBarTitles[0]),
          new Classify(title: appBarTitles[1]),
          new Shopping(title: appBarTitles[2]),
          new MySelf()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: getIcon(0),
            title: getTabTitle(0),
          ),
          new BottomNavigationBarItem(
            icon: getIcon(1),
            title: getTabTitle(1),
          ),
          new BottomNavigationBarItem(icon: getIcon(2), title: getTabTitle(2)),
          new BottomNavigationBarItem(icon: getIcon(3), title: getTabTitle(3))
        ],
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: page,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return new Scaffold(
//      appBar: new AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: new Text(widget.title),
//      ),
//      body: new Container(
//        padding: const EdgeInsets.all(20.0),
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: new Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug paint" (press "p" in the console where you ran
//          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
//          // window in IntelliJ) to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Container(
//              child: new Image(
////                  padding:,
//                  image: new AssetImage('images/bizhi.jpg')
//              ),
//            ),
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              '$_counter',
//              style: Theme
//                  .of(context)
//                  .textTheme
//                  .display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
