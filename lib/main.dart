//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('sorted'),
        backgroundColor: Colors.red,
      ),
      body: Boxes(),
    );
  }
}

class Boxes extends StatefulWidget {
  @override
  _BoxesState createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  Expanded arr({double w, Color c}) {
    return Expanded(
      child: Container(
        color: c,
        width: w,
      ),
    );
  }

  int n = 5;
  int a;
  List<double> l = [30.0, 50.0, 150.0, 100.0, 120.0];

  List generate() {
    int k = Random().nextInt(10) + 20;
    n = k;

    List<double> no = [];
    int mem;

    for (int j = 0; j < k; j++) {
      mem = Random().nextInt(200) + 70;

      double m = mem.toDouble();
      no.add(m);
    }
    return no;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.yellow[900],
                child: Text('reset'),
                onPressed: () {
                  setState(() {
                    l = generate();
                  });
                },
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: Text('sort'),
                onPressed: () {
                  setState(() {
                    l.sort();
                  });
                },
              )
              /*Container(
                width: double.infinity,
              )*/
            ],
          ),

          //for (var i in l) (arr(w: i, c: Colors.yellow)),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              for (int j = 0; j < n; j++)
                (arr(
                    w: l[j],
                    c: Colors.purple[(Random().nextInt(8) + 1) * 100])),
            ],
          )
        ],
      ),
    );
  }
}
