import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:wordpress_flutter/maps.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장찾기'),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Image.asset(
            "assets/ring.png",
          ),
        ],
      ),
      body: new Container(
        // padding: EdgeInsets.only(top: 0.0),
        // margin: EdgeInsets.only(top: 0.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  height: 250.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/beans.jpg"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.7), BlendMode.darken),
                    ),
                  ),
                ),
                new Image.asset(
                  "assets/wordpress logo.png",
                  height: 200.0,
                ),
              ],
            ),
            new Column(
              children: <Widget>[
                new Container(),
                new Text(
                  "\n주소 경상북도 포항시 북구 한동로 558\n",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 13.0,
                  ),
                ),
                new Text(
                  "전화 TEL: 054-123-1234\n",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 13.0,
                  ),
                ),
                new Text(
                  "영업 연중무휴(9:00~22:00)\n",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
            new Container(
              child: LocationInput(),
            ),
          ],
        ),
      ),
      // new Container(
      //   child: LocationInput(),
      // ),
      // LocationInput(),
    );
  }
}
