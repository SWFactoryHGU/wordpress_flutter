import 'package:flutter/material.dart';
import 'dropMenu.dart';

import 'home.dart';


class NoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
        title: new Row(children: <Widget>[
          // new IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => HomePage()),
          //     );},),
          new Expanded(
              child: new Text(
            "What's New",
            textAlign: TextAlign.center,
          )),
          new IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          new Icon(Icons.info),
        ]),
      ),
      drawer: DropMenu(),
      bottomNavigationBar: new Row(children: <Widget>[
        new Icon(Icons.arrow_back_ios),
        new Icon(Icons.refresh),
        new Icon(Icons.close),
        new Icon(Icons.arrow_forward_ios),
      ]),
    );
  }
}
