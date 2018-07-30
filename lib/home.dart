import 'package:flutter/material.dart';
import 'package:wordpress_flutter/dropMenu.dart';
import 'package:wordpress_flutter/Menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordpress Cafe'),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Image.asset(
            "assets/ring.png",
          ),
        ],
      ),
      drawer: DropMenu(),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Color.fromRGBO(28, 26, 33, 1.0),
            ),
          ),
          new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                      ),
                    ),
                    new Text(
                      "안녕하세요.\n워드프레스 카페입니다.",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    new Image.asset(
                      "assets/wordpress logo.png",
                      height: 120.0,
                    ),
                  ],
                ),
                new Container(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                  ),
                  child: new Text(
                    "카페 VIP가 되시면\n생일 무료음료 쿠폰과 다양한 혜택을 받으실 수 있습니다.",
                    style: TextStyle(
                      color: Color.fromRGBO(151, 151, 151, 1.0),
                      fontSize: 13.0,
                    ),
                  ),
                ),
                new Divider(
                  color: Color.fromRGBO(204, 203, 203, 1.0),
                  height: 20.0,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new IconButton(
                          icon: ImageIcon(
                            new AssetImage("assets/coffee.png"),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                          tooltip: '메뉴보기',
                          iconSize: 150.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()),
                            );
                          },
                        ),
                        new Text(
                          "메뉴보기",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      height: 200.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(
                          color: Color.fromRGBO(204, 203, 203, 0.5),
                        ),
                      ),
                    ),
                    new Column(
                      children: <Widget>[
                        new IconButton(
                          icon: ImageIcon(
                            new AssetImage("assets/store.png"),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                          tooltip: '매장찾기',
                          iconSize: 150.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                        ),
                        new Text(
                          "매장찾기",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                new Divider(
                  color: Color.fromRGBO(204, 203, 203, 1.0),
                  height: 20.0,
                ),
                new Container(
                  // padding: const EdgeInsets.only(
                  //   top: 10.0,
                  //   bottom: 15.0,
                  // ),
                  alignment: Alignment.center,
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "운영시간",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Text(
                        "9:00 - 22:00",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  alignment: Alignment.center,
                  height: 74.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ad.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.4), BlendMode.darken),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "콜드블루 커피 신메뉴 출시",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Text(
                        "SNS에 후기쓰고 1+1 쿠폰받자!",
                        style: TextStyle(
                          color: Color.fromRGBO(206, 39, 247, 1.0),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
