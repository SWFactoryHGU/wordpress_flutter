import 'package:flutter/material.dart';
import 'package:wordpress_flutter/home.dart';
import 'package:wordpress_flutter/menu.dart';
import 'package:wordpress_flutter/notice.dart';
import 'package:wordpress_flutter/findStore.dart';
import 'package:url_launcher/url_launcher.dart';

class DropMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          new UserAccountsDrawerHeader(
            margin: const EdgeInsets.only(
              top: 0.0,
              bottom: 0.0,
            ),
            decoration: new BoxDecoration(
              color: new Color.fromRGBO(229, 229, 229, 1.0),
            ),
            currentAccountPicture: Image(
              image: new AssetImage("assets/user.png"),
            ),
            accountName: new Text(
              "더운날엔 아이스아메리카노 벌컥벌컥",
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1.0),
              ),
            ),
            accountEmail: new Text(
              "21500214@handong.edu",
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1.0),
              ),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new AssetImage("assets/settings.png"),
                  backgroundColor: new Color.fromRGBO(229, 229, 229, 1.0),
                ),
              ),
            ],
          ),
          new ListTileTheme(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 132.0,
                  width: 304.0,
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 0.0,
                    right: 20.0,
                  ),
                  margin: const EdgeInsets.only(
                    top: 0.0,
                  ),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/food.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.4), BlendMode.darken),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "   카카오 선물하기로\n  선물시 30Points 적립!",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/right-arrow.png"),
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new ListTile(
              dense: true,
              leading: Image.asset(
                "assets/home.png",
                height: 30.0,
              ),
              title: new Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
          new ListTile(
              dense: true,
              leading: Image.asset(
                "assets/coffee.png",
                height: 30.0,
              ),
              title: new Text("Menu"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              }),
          new ListTile(
            dense: true,
            leading: Image.asset(
              "assets/barcode.png",
              height: 30.0,
            ),
            title: new Text("e-Frequency"),
            onTap: () {
              _showAlert(context);
            },
          ),
          new ListTile(
            dense: true,
            leading: Image.asset(
              "assets/coupon.png",
              height: 30.0,
            ),
            title: new Text("Coupon"),
            onTap: () {
              _showAlert(context);
            },
          ),
          new ListTile(
              dense: true,
              leading: Image.asset(
                "assets/news.png",
                height: 30.0,
              ),
              title: new Text("What's New"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticePage()),
                );
              }),
          new ListTile(
              dense: true,
              leading: Image.asset(
                "assets/alexa.png",
                height: 30.0,
              ),
              title: new Text("Alexa order"),
              onTap: () {
                _launchURL();
              }),
          new ListTile(
              dense: true,
              leading: Image.asset(
                "assets/store.png",
                height: 30.0,
              ),
              title: new Text("Find store"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              }),
        ],
      ),
    );
  }
}

//connected link
_launchURL() async {
  const url = 'http://dnjemvmfptm1.dothome.co.kr';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//alert Dialog
_showAlert(BuildContext context) {
  AlertDialog dialog = new AlertDialog(
    content: new Text(
      "아직 준비 중인 서비스입니다.",
      style: new TextStyle(
        fontSize: 15.0,
      ),
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: new Text('확인'),
      )
    ],
  );
  showDialog(context: context, child: dialog);
}
