import 'package:flutter/material.dart';
import 'package:wordpress_flutter/maps.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장찾기'),
        backgroundColor: Colors.black87,
        // actions: <Widget>[
        //   Image.asset(
        //     "assets/ring.png",
        //   ),
        // ],
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            new Text(
              '\n주소 경상북도 포항시 북구 한동로 558\n전화 TEL: 054-123-1234\n영업 연중무휴(9:00~22:00)\n',
              textAlign: TextAlign.center,
            ),
            new Expanded(
              child: LocationInput(),
            ),
          ],
        ),
      ),
    );
  }
}
