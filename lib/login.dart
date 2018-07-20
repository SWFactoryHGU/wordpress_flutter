import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/cafe.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    top: 80.0,
                    left: 35.0,
                  ),
                  child: Text(
                    'Welcome\nWordpress\nCafe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 35.0,
                  ),
                  child: Text(
                    'Wordpress cafe 멤버가 되시면 다양한 혜택을\n받으실 수 있습니다.',
                    style: TextStyle(
                      color: Color.fromRGBO(252, 252, 252, 1.0),
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 130.0,
                    left: 35.0,
                    right: 35.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Email address',
                          hintStyle: new TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1.0),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color.fromRGBO(0, 0, 0, 1.0),
                        height: 0.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: new TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1.0),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 145.0,
                  ),
                  child: Text(
                    'Forgot your password?\n',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 35.0,
                  ),
                  child: RaisedButton(
                    color: new Color.fromRGBO(245, 58, 51, 1.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 100.0,
                    ),
                    elevation: 40.0,
                    child: new Text(
                      'Log In',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 35.0,
                  ),
                  child: Text(
                    'Don\'t have an account?\n',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 0.0,
                    left: 80.0,
                  ),
                  child: RaisedButton(
                    color: new Color.fromRGBO(245, 58, 51, 0.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 0.0,
                    ),
                    // elevation: 40.0,
                    child: new Text(
                      '아니요! 로그인없이 시작할래요!',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontSize: 12.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
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
