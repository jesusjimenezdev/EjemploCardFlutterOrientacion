import 'package:flutter/material.dart';


void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hola",
      home: OrientationList(
        title: "Titulo",
      ),
    );
  }
}

class MyCard extends StatelessWidget {

  final Widget title;
  final Widget icon;

  MyCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: new Card(
        child: new Container(
          padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            this.title, this.icon
          ],
        ),
        )
      ),
    );
  }
}


class OrientationList extends StatelessWidget {

  final String title;
  final double iconSize = 60.0;
  final double fontSize = 30.0;

  OrientationList({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            // Create a grid with 1 column in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: orientation == Orientation.portrait ? 1 : 3,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new MyCard(title: new Text("Me gusta flutter", style: new TextStyle(fontSize: fontSize),), icon: new Icon(Icons.favorite, size: iconSize, color: Colors.red,)),
              new MyCard(title: new Text("Me gusta flutter", style: new TextStyle(fontSize: fontSize),), icon: new Icon(Icons.favorite, size: iconSize, color: Colors.blue,)),
              new MyCard(title: new Text("Me gusta flutter", style: new TextStyle(fontSize: fontSize),), icon: new Icon(Icons.favorite, size: iconSize, color: Colors.amberAccent,),
              )
            ],
          );
        },// builder
      ),
    );
  }
}
